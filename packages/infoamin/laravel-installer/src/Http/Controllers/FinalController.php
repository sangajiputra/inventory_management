<?php

namespace Infoamin\Installer\Http\Controllers;

use AppController;
use Artisan;

class FinalController extends AppController
{
    /**
     * Complete the installation
     *
     * @return \Illuminate\View\View
     */
    public function finish()
    {
        changeEnvironmentVariable('APP_DEBUG', false);

        // only needed for RoverCRM - see env APP_INSTALL
        changeEnvironmentVariable('APP_INSTALL', 'true');

        // Change key in .env
        Artisan::call('key:generate');
        Artisan::call('config:clear');
        Artisan::call('cache:clear');
        Artisan::call('view:clear');

        return view('vendor.installer.finish');
    }
}
