<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\TrimStrings as Middleware;
use Illuminate\Http\Request;

class TrimStrings extends Middleware
{
    /**
     * The names of the attributes that should not be trimmed.
     *
     * @var array
     */
    protected $except = [
        'password',
        'password_confirmation',
        'body',
        'category',
    ];


    /**
     * Transform the given value into striped value.
     *
     * @param  string  $request
     * @return striped request input
     */
    protected $exceptAllowHTMLTags = [
        'password',
        'password_confirmation',
        'body',
        'description',
    ];
    
    public function __construct(Request $request)
    {
        $urlSegments = $request->segments();

        foreach ($urlSegments as $key => $value) {
            if ($value != strip_tags($value)) {
                return redirect('dashboard');
            }
        }

        if ($request->isMethod('post')) {
            $requestAll = $request->all();
            $data = [];
            foreach ($requestAll as $key => $value) {
                if (is_array($value)) {
                    foreach ($value as $secondKey => $secondValue) {
                        if (is_array($secondValue)) {
                            foreach ($secondValue as $thirdKey => $thirdValue) {
                                if (is_array($thirdValue)) {
                                    foreach ($thirdValue as $fourthKey => $fourthValue) {
                                       $data[$key][$secondKey][$thirdKey][$fourthKey] = $this->iterateInputValue($fourthKey, $fourthValue);
                                    }
                                } else {
                                    $data[$key][$secondKey][$thirdKey] = $this->iterateInputValue($thirdKey, $thirdValue);

                                }
                            }
                        } else {
                            $data[$key][$secondKey] = $this->iterateInputValue($secondKey, $secondValue);
                        }
                    }
                } else {
                    $data[$key] = $this->iterateInputValue($key, $value);
                }
            }
            $request->replace($data);
        }
    }

    /**
     * iterateInputValue method
     * @param  string $key
     * @param  array $value
     * @return array
     */
    private function iterateInputValue($key, $value)
    {
        if (in_array($key, $this->except, true)) {
            return $value;
        } else {
            return trim(xss_clean($value));
        }
    }
}
