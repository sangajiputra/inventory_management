<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class CustomerBranch extends Model
{
	public $timestamps = false;

    public function customer()
    {
        return $this->belongsTo("App\Models\Customer", 'customer_id');
    }
    public function billingCountry()
    {
    	return $this->belongsTo("App\Models\Country", 'billing_country_id');
    }
    public function shippingCountry()
    {
        return $this->belongsTo("App\Models\Country", 'shipping_country_id');
    }
    public function saleOrders()
    {
        return $this->hasMany('App\Models\SaleOrder', 'customer_branch_id');
    }
}
