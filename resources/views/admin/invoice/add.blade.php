@extends('layouts.app')
@section('css')
<link rel="stylesheet" href="{{ asset('public/datta-able/plugins/select2/css/select2.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{asset('public/dist/css/bootstrap-select.min.css')}}">
<link rel="stylesheet" href="{{ asset('public/dist/plugins/jQueryUI/jquery-ui.min.css') }}" type="text/css"/>
<link rel="stylesheet" href="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('public/dist/css/invoice-style.min.css') }}">
@endsection
@section('content')
<div class="col-sm-12" id="sales-invoice-add-container">
  <form id="invoiceForm" action="{{ url('invoice/store') }}" method="post">
    {{ csrf_field() }}
    <input type="hidden" name="menu" value="{{ $menu }}">
    <input type="hidden" name="object_type" value="{{ $object_type }}">
    <input type="hidden" name="sub_menu" value="{{ isset($sub_menu) ? $sub_menu : '' }}">
    <input type="hidden" name="currency_id" id="inv-currency">
    <input type="hidden" name="discount_on" id="discount_on">
    <input type="hidden" name="tax_type" id="tax_type">
    <input type="hidden" name="sales_type" value="1">
    <input type="hidden" name="has_tax" id="invItem-Tax">
    <input type="hidden" name="has_description" id="invItem-Details">
    <input type="hidden" name="has_item_discount" id="invItem-Discount">
    <input type="hidden" name="has_hsn" id="invItem-hsn">
    <input type="hidden" name="has_other_discount" id="inv-other-discount">
    <input type="hidden" name="has_shipping_charge" id="inv-shipping">
    <input type="hidden" name="has_custom_charge" id="inv-custom-amount">
    <input type="hidden" name="indivisual_discount_price" id="indivisual-discount-price" value="0">
    <input type="hidden" id="colspan" value="3">
    <div class="card">
      <div class="card-header">
        <h5>{{ __('New Invoice') }}</h5>
      </div>

      <div class="card-body">
        <div class="m-t-10 p-0">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group row mb-0">
                <label class="col-form-label col-md-4">
                  {{ __('Customer') }}<span class="text-danger"> *</span>
                </label>
                <div class="col-md-7 p-md-0 pr-md-4" id="customer-list-in-quotation">
                  @if(isset($customer_id) && !empty($customer_id))
                      <input type="hidden" name="customer_id" value="{{$customer_id }}">
                   @endif
                  <select class="select2 invoice-customers" name="customer_id" id="customers" {{ isset($customer_id) && !empty($customer_id) ? 'disabled' : ''}}>
                    <option value="">{{ __('Select One') }}</option>
                    @foreach($customerData as $data)
                      @if (isset($data->id) && isset($data->currency->id))
                        <option value="{{ $data->id }}" {{ !empty($customer_id) && ($customer_id == $data->id) ? 'selected' : '' }} data-currency_id="{{ isset($data->currency->id) ?  $data->currency->id : '' }}"  data-symbol="{{ isset($data->currency->symbol) ? $data->currency->symbol : '' }}" data-name="{{ isset($data->currency->name) ? $data->currency->name : '' }}">{{ $data->first_name . ' ' . $data->last_name }} ({{ isset($data->currency->name) ?  $data->currency->name : '' }})</option>
                      @endif
                    @endforeach
                  </select>
                  <label id="customers-error" class="error" for="customers"></label>
                </div>
                <div class="col-md-1 p-md-0" id="add-button-md">
                  <button class="btn btn-outline-primary custom-btn-small float-right m-0" type="button" data-remote="{{ url('pos/add-customer') }}?type=invoice" data-label="add-customer" data-toggle="modal" data-target="#theModal"><span class="feather icon-user-plus"></span></button>
                </div>
                <label class="col-md-4 no-display" id="customer-address-left"></label>
                <label class="col-md-8 pl-md-1 no-display" id="customer-address"></label>
                <span id="customer_error"></span>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group row">
                <label class="col-md-4 col-form-label">{{ __('Reference') }}<span class="text-danger"> *</span></label>
                <div class="input-group date col-md-8 p-md-0">
                  <div class="input-group-prepend">
                    <span class="input-group-text">INV-</span>
                  </div>
                  <input id="reference_no" class="form-control" value='{{ sprintf("%04d", $invoice_count + 1) }}' type="text">
                </div>
                <input type="hidden"  name="reference" id="reference_no_write" value="">
                <div class="col-md-4"></div>
                <div id="errMsg"></div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group row">
                <label class="col-form-label col-md-4">{{ __('Location') }}</label>
                <div class="col-md-8 p-md-0">
                  <select class="select2" name="location_id" id="location">
                    @foreach($locations as $data)
                      <option value="{{ $data->id }}" {{ $data->is_active == "1" ? 'selected' : '' }} >{{ $data->name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group row">
                <label class="col-form-label col-md-4">{{ __('Date') }}<span class="text-danger"> *</span></label>
                <div class="input-group date col-md-8 p-md-0">
                  <div class="input-group-prepend">
                    <i class="fas fa-calendar-alt input-group-text"></i>
                  </div>
                  <input class="form-control" id="datepicker" type="text" name="order_date">
                </div>
                <div class="col-md-4"></div>
                <label id="datepicker-error" class="error" for="datepicker"></label>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group row">
                <label class="col-md-4 col-form-label">
                  {{ __('Payment Term') }}
                </label>
                <div class="col-md-8 p-md-0">
                  <select class="select2" name="payment_term_id">
                    @foreach($paymentTerms as $term)
                      <option value="{{ $term->id }}" {{ $term->is_default == 1 ? 'selected' : '' }} >{{ $term->name  }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group row">
                <label for="inv-type" class="col-md-4 col-form-label"> {{ __('Invoice Type') }} </label>
                <div class="inv-header-type col-md-8 p-md-0">
                  @if($menu == 'project')
                    <input type="hidden" name="invoice_type" value="hours">
                  @endif
                  <select name="invoice_type" id="inv-type" class="form-control select2" data-previous="quantity"  {{ $menu == 'project' ? "disabled" : "" }} data-type="invoice">
                    @if($menu != 'project')
                      <option value="quantity">{{ __('Product') }}</option>
                    @endif
                    <option value="hours">{{ __('Service') }}</option>
                  </select>
                </div>
              </div>
            </div>
            @if($menu == 'project')
              <div class="col-md-6">
                <div class="form-group row">
                  <label for="project-id" class="col-md-4 col-form-label"> {{ __('Project') }} </label>
                  <div class="inv-header-type col-md-8 p-md-0">
                    <select name="project_id" id="project-id" class="form-control select2">
                      @foreach($projects as $project)
                        <option value="{{ $project->id }}" {{ $project->id == $project_id ? 'selected' : ''}} >{{ $project->name }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
              </div>
            @endif
            <div class="col-md-6 no-display" id="exchangeRateBlock">
              <div class="form-group row">
                <label class="col-md-4 col-form-label">{{ __('Exchange Rate') }}</label>
                <div class="inv-exchange-rate col-md-8 p-md-0">
                  <input type="text" name="exchange_rate" id="inv-exchange-rate" class="form-control positive-float-number">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <h5 class="itemName">{{ __('Items') }}</h5>
        <div class="card-header-right d-inline-block">
          <div class="btn-group card-option">
            <i class="feather icon-settings btn color-04a9f5" data-toggle="modal" data-target="#myModal"></i>
          </div>
        </div>
      </div>
      <div class="card-body">
        <div class="m-t-10 p-0">
          <div class="row">
            <div class="col-sm-8 mb-3">
              <div class="form-group row mb-0">
                <label class="col-md-2 col-form-label">{{ __('Add')  }}&nbsp;&nbsp;<span class="searchItemTh"> {{ __('Item')  }} </span></label>
                <input class="form-control auto col-md-9" placeholder="{{ __('Search Item') }}" id="search">
                <ul class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="no_div" tabindex="0">
                    <li>{{ __('No record found')  }} </li>
                </ul>
              </div>
              <div class="row">
                <div class="col-md-2"></div>
                <div id="error_message" class="text-danger col-md-10 p-0"></div>
              </div>
            </div>
            <div class="col-sm-4">
              <div id="addRow-1" class="addRowContainer float-right">
                <span data-row-no="1" class="addRow">{{ __('Add Custom Item') }}</span>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12 m-t-10 p-2">
              <div class="inv-container">
                <div class="inv-content" id="inv-content">
                  <div id="itemInputContainer" class="table-responsive">
                    <table class="table" id="product-table">
                      <thead>
                        <tr class="tbl_header_color">
                          <th class="itemName">{{ __('Items')  }}</th>
                          <th class="itemHSN text-center w-10">{{ __('HSN')  }}</th>
                          <th class="itemQty text-center w-10">
                            <span class="qtyTh">{{ __('Quantity')  }}</span>
                            <span class="hourTh">{{ __('Hours')  }}</span>
                          </th>
                          <th class="itemPrice text-center w-10">
                            <span class="qtyPriceTh">{{ __('Price')  }} (<span class="currencySymbol">{{ $default_currency->symbol }}</span>)</span>
                            <span class="hourPriceTh">{{ __('Rate')  }} (<span class="currencySymbol">{{ $default_currency->symbol }}</span>)</span>
                            <span class="amountTh">{{ __('Amount')  }}</span>
                          </th>
                          <th class="itemDiscount text-center w-10" colspan="2 w-10">{{ __('Discount')  }}</th>
                          <th class="itemTax text-center w-15">{{ __('Tax')  }}</th>
                          <th class="itemAmount text-center w-10">{{ __('Amount')  }} (<span class="currencySymbol">{{ $default_currency->symbol }}</span>)</th>
                          <th class="itemAction w-5">{{  __('Action') }}</th>
                        </tr>
                      </thead>
                    </table>
                  </div>
                  <div id="itemInputFooter" class="table-responsive">
                    <table>
                      <tr>
                        <th colspan="3" class="text-right">{{ __('Subtotal') }}</th>
                        <td><span id="subTotal">0</span></td>
                      </tr>
                      @foreach(json_decode($taxes) as $tax)
                        <tr class="taxRow" id="taxRow-{{ $tax->id }}">
                          <th class="text-right">{{ $tax->name }}</th>
                          <td colspan="2"><span class="ml-20p">{{ formatCurrencyAmount($tax->tax_rate) }}%</span><input value="{{ $tax->tax_rate }}" name="tax" class="form-control no-display" id="inputTaxPercentage-{{ $tax->id }}" type="text"></td>
                          <td ><span id="taxTotalValue-{{ $tax->id }}">0</span></td>
                        </tr>
                      @endforeach
                      <tr class="itemTaxExtra no-display">
                        <th colspan="3" class="text-right">{{ __('Total Tax') }}</th>
                        <td><span id="taxTotal">0</span></td>
                      </tr>
                      <tr class="itemDiscount">
                        <th colspan="3" class="text-right">{{ __('Item Discounts') }}</th>
                        <td><span id="itemDiscountTotal">0</span></td>
                      </tr>
                      <tr class="otherDiscount">
                        <th class="text-right pr-2">{{ __('Other Discounts') }} </th>
                        <td class="pr-0">
                          <input name="other_discount_amount" class="form-control text-right positive-float-number" placeholder="0.00" id="inputOtherDiscount" type="text">
                        </td>
                        <td class="pl-0">
                            <select name="other_discount_type" id="otherDiscountType" class="form-control select2">
                                <option value="%">%</option>
                                <option value="$">{{ __('Flat') }}</option>
                            </select>
                        </td>
                        <td><span id="otherDiscountTotal">0</span></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><label id="inputOtherDiscount-error" class="error float-left" for="inputOtherDiscount"></label></td>
                      </tr>
                      <tr class="shippingAmount">
                        <th class="text-right pr-2">{{ __('Shipping') }}</th>
                        <td colspan="2">
                          <input name="shipping_charge" class="form-control text-right positive-float-number" placeholder="0.00" id="inputShipping" type="text">
                        </td>
                        <td ><span id="shippingTotal">0</span></td>
                      </tr>
                      <tr>
                        <td></td>
                        <td><label id="inputShipping-error" class="error float-left" for="inputShipping"></label></td>
                      </tr>
                      <tr class="customAmount">
                        <th>
                          <input name="custom_charge_title" class="form-control text-right" type="text" id="customAmountDescription" placeholder="Custom Amount">
                        </th>
                        <td colspan="2">
                          <input name="custom_charge_amount" class="form-control text-right positive-float-number" placeholder="0.00" id="inputCustomAmount" type="text">
                        </td>
                        <td >
                          <span id="customAmountTotal">0</span>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <label id="customAmountDescription-error" class="error float-left" for="customAmountDescription"></label>
                        </td>
                        <td>
                          <label id="inputCustomAmount-error" class="error float-left" for="inputCustomAmount"></label>
                        </td>
                      </tr>
                      <tr class="grandTotal">
                        <input type="hidden" name="total" value="0" id="grandTotalInput">
                        <input type="hidden" name="totalValue" id="totalValue">
                        <th colspan="3" class="text-right">{{ __('Total') }}</th>
                        <td>
                          <span id="grandTotal">0</span>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-sm-12">
              <div class="form-group row">
                  <label>{{ __('Note') }}</label>
                  <textarea placeholder="{{ __('Description') }} ..." rows="3" class="form-control" name="comment"></textarea>
              </div>
              <div class="form-group row">
                <div class="checkbox checkbox-primary checkbox-fill d-inline">
                  <input type="checkbox" name="has_comment" id="checkbox-p-fill-1" checked="">
                  <label for="checkbox-p-fill-1" class="cr"><strong>{{ __('Print note on pdf') }}</strong></label>
                </div>
              </div>
              <div class="form-group row">
                <label class="col-sm-1 col-form-label">{{ __('File') }}</label>
                <div class="col-md-11">
                  <div class="dropzone-attachments" id="reply-attachment">
                    <div class="event-attachments">
                      <div class="add-attachments"><i class="fa fa-plus"></i></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-1"></div>
                <div class="col-md-11" id="uploader-text"></div>
              </div>
              <div class="form-group row">
                <label class="col-md-1 control-label"></label>
                <div class="col-md-8">
                  <span class="badge badge-danger">{{ __('Note') }}!</span> {{ __('Allowed File Extensions: jpg, png, gif, docx, xls, xlsx, csv and pdf') }}
                </div>
              </div>
              <div class="form-group row ml-1">
                <button class="btn btn-primary custom-btn-small" type="button" id="btnSubmit"><i class="comment_spinner spinner fa fa-spinner fa-spin custom-btn-small display_none"></i><span id="spinnerText">{{ __('Submit') }} </span></button>
                <a href="{{ url($url) }}" class="btn btn-danger custom-btn-small float-left">{{  __('Cancel') }}</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</div>
<div class="modal fade" id="theModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content ">
      <div class="modal-header">
        <h5 class="modal-title" id="theModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary custom-btn-small" data-dismiss="modal"><?= __('Close'); ?></button>
        <button type="button" id="theModalSubmitBtn" class="btn btn-primary custom-btn-small"><?= __('Submit'); ?></button>
        <span class="ajax-loading"></span>
      </div>
    </div>
  </div>
</div>

@include('admin.invoice.setting-modal-create')

@endsection
@section('js')
<script src="{{ asset('public/dist/plugins/bootstrap-select/dist/js/bootstrap-select.min.js') }}"></script>
<script src="{{ asset('public/datta-able/plugins/select2/js/select2.full.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/jQueryUI/jquery-ui.min.js') }}">></script>
<script src="{{ asset('public/dist/js/moment.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/dropzone/dropzone.min.js') }}"></script>
<script src="{{ asset('public/dist/js/jquery.validate.min.js') }}"></script>
<script src="{{ asset('public/datta-able/plugins/sweetalert/js/sweetalert.min.js') }}"></script>
<script src="{{ asset('public/dist/js/custom/invoice-script.min.js') }}"></script>
{!! translateValidationMessages() !!}
<script>
  'use strict';
  var taxType = "{!! $tax_type!!}";
  var taxes = {!! $taxes !!};
  var defaultCurrencyId = '{!! $default_currency->id !!}';
  var exchange_rate_decimal_digits = "{{ $exchange_rate_decimal_digits }}";
  var rowNo;
  var customer_id = "{{ !empty($customer_id) ? $customer_id : '' }}";
</script>
<script src="{{ asset('public/dist/js/custom/sales-purchase.min.js') }}"></script>
<script src="{{ asset('public/dist/js/custom/sales.min.js') }}"></script>
@endsection
