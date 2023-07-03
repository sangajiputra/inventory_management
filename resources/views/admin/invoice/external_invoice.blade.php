@extends('layouts.app3')
@section('css')
<link rel="stylesheet" href="{{ asset('public/datta-able/plugins/select2/css/select2.min.css') }}">
<link rel="stylesheet" href="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('public/dist/css/external-link.min.css') }}">
@endsection

@section('content')
<div class="col-sm-12 p-4" id="cus-viewinvoice-container">
  <div class="col-sm-12">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <div class="m-5">
              <div class="row m-t-10 ml-2">
                <div class="card-header col-sm-12">
                  <div class="float-left ml-2">
                  @if($saleInvoiceData->total > 0)
                      @if($saleInvoiceData->paid == 0)
                        <div class="btn-unpaid">{{ __('Unpaid') }}</div>
                      @elseif($saleInvoiceData->paid > 0 && $saleInvoiceData->total > $saleInvoiceData->paid)
                        <div class="btn-paid-partial">{{ __('Partially Paid') }}</div>
                      @elseif($saleInvoiceData->total <= $saleInvoiceData->paid)
                        <div class="btn-paid">{{ __('Paid') }}</div>
                      @endif
                    @else
                      <div class="btn-paid">{{ __('Paid')}}</div>
                    @endif
                  </div>
                  <div class="btn-group float-right row mr-2 mt-1 pl-3">
                    <a target="_blank" href="{{ URL::to('/') }}/invoice/external-print-pdf/{{ $id }}?type=pdf" title="PDF" class="btn custom-btn-small btn-outline-primary">{{ __('PDF')  }}</a>
                    @if($saleInvoiceData->total > $saleInvoiceData->paid)
                  
                          @if($paymentMethods['Bank'] == 1)
                            <button title="{{ __('Pay Now') }}" type="button" class="btn custom-btn-small btn-outline-primary pay-with-bank" data-toggle="modal" data-target="#payModal">{{ __('Pay With Bank') }}</button>
                          @endif
                          @if($paymentMethods['Stripe'] == 1)
                            <button title="{{ __('Pay Now') }}" type="button" class="btn custom-btn-small btn-outline-primary pay-with-stripe" data-toggle="modal" data-target="#stripe">{{ __('Pay With Stripe') }}</button>
                          @endif
                          @if ($paymentMethods['Paypal'] == 1)
      
      
                          <button type="submit" title="Pay Now" class="btn custom-btn-small btn-outline-primary paypal pay-with-paypal">{{ __('Pay With PayPal') }}</button>
                          <form class="form-horizontal main_from float-right" id="paypal-form" action="{{ url('paypal-payment') }}" method="POST">
                            <input type="hidden" value="{{ csrf_token() }}" name="_token" id="token">
                            <input type="hidden" name="payPalAmount" value="{{ $saleInvoiceData->total-$saleInvoiceData->paid }}">
                            <input type="hidden" name="curencyName" value="{{ isset($saleInvoiceData->currency->name) ? $saleInvoiceData->currency->name : '' }}">
                            <input type="hidden" name="curencyId" value="{{ isset($saleInvoiceData->currency->id) ? $saleInvoiceData->currency->id : '' }}">
                            <input type="hidden" name="invoiceId" value="{{ $saleInvoiceData->id }}">
                            <input type="hidden" name="payPalReference" value="{{ $reference }}">
                            <input type="hidden" name="customerId" id="customerId" value="{{ $saleInvoiceData->customer_id }}">
                            <input type="hidden" name="invoiceRef" value="{{ $saleInvoiceData->reference }}">
                            <input type="hidden" name="redirectUrl" value="{{ url()->current() }}">
                          </form>
                          @endif
                    @endif
                  </div>
                </div>
                <div class="col-md-{{ $saleInvoiceData->pos_shipping ? 3 : 4 }} m-b-15">
                  <h6>#{{ $saleInvoiceData->reference }}</h6>
                  <strong class="text-black">{{ $company_name }}</strong><br>
                  <strong>{{ $company_street }}</strong><br>
                  <strong>{{ $company_city }}, {{ $company_state }}</strong><br>
                  <strong>{{ $company_country_name }}, {{ $company_zipCode }}</strong><br>
                </div>
                <div class="col-md-{{ $saleInvoiceData->pos_shipping ? 3 : 4 }} m-b-15">
                  <strong class="text-black">{{ __('Bill To') }}</strong><br>
                  <strong class="text-black">{{ isset($saleInvoiceData->customer->first_name) ? $saleInvoiceData->customer->first_name : '' }} {{ isset($saleInvoiceData->customer->last_name) ? $saleInvoiceData->customer->last_name : __('Walking customer') }}</strong><br>
                  <strong>{{ isset($saleInvoiceData->customerBranch->billing_street) ? $saleInvoiceData->customerBranch->billing_street : '' }} </strong><br>
                  <strong>{{ isset($saleInvoiceData->customerBranch->billing_state) ? $saleInvoiceData->customerBranch->billing_state : '' }}{{ isset($saleInvoiceData->customerBranch->billing_city) ? ', ' . $saleInvoiceData->customerBranch->billing_city : '' }}</strong><br>
                    <strong>{{ isset($saleInvoiceData->customerBranch->billingCountry) ? $saleInvoiceData->customerBranch->billingCountry->name : '' }} {{ isset($saleInvoiceData->customerBranch->billing_zip_code) ? ', ' . $saleInvoiceData->customerBranch->billing_zip_code : '' }}</strong><br>
                </div>
                @if($saleInvoiceData->pos_shipping)
                  <div class="col-md-3 m-b-15">
                    <strong>{{ __('Shipment') }}</strong><br>
                    @if(isset($saleInvoiceData->shipping_address->name))
                      <strong>{{ $saleInvoiceData->shipping_address->name }}</strong><br>
                    @endif
                    @if(isset($saleInvoiceData->shipping_address->ship_email))
                      <strong>{{ $saleInvoiceData->shipping_address->ship_email }}</strong><br>
                    @endif
                    <strong>{{ isset($saleInvoiceData->shipping_address->ship_city) ? $saleInvoiceData->shipping_address->ship_city : "" }} {{ isset($saleInvoiceData->shipping_address->ship_city) && isset($saleInvoiceData->shipping_address->ship_state) ? ', ' : '' }} {{ isset($saleInvoiceData->shipping_address->ship_state) ? $saleInvoiceData->shipping_address->ship_state : '' }}</strong><br>
                    <strong>{{ isset($saleInvoiceData->shipping_address->ship_country) ? $saleInvoiceData->shipping_address->ship_country : "" }} {{ isset($saleInvoiceData->shipping_address->ship_country) && isset($saleInvoiceData->shipping_address->ship_zipCode) ? ' - ': '' }} {{ isset($saleInvoiceData->shipping_address->ship_zipCode) ? $saleInvoiceData->shipping_address->ship_zipCode : '' }}</strong><br>
                  </div>
                @endif
                <div class="col-md-{{ $saleInvoiceData->pos_shipping ? 3 : 4 }} m-b-15">
                  @if($saleInvoiceData->transaction_type != "POSINVOICE" && !empty($saleInvoiceData->order_reference_id))
                    <strong>{{ __('Quotation No') }} # {{ $saleOrderData->reference }}</strong><br>
                  @endif
                  <strong>{{ __('Location') }} : {{ $saleInvoiceData->location->name }}</strong><br>
                  <strong>{{  __('Invoice Date') }} : {{ formatDate($saleInvoiceData->order_date) }}</strong><br>
                  @if($saleInvoiceData->due_date)
                    <strong>{{ __('Due Date') }} : {{ formatDate($saleInvoiceData->due_date) }}</strong><br>
                  @endif
                </div>
              </div>
              <div class="row mt-0">
                <div class="col-md-12">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="salesInvoice">
                      <thead>
                        <tr class="tbl_header_color dynamicRows">
                          @if($saleInvoiceData->invoice_type == 'hours')
                            <th>{{  __('Service') }}</th>
                          @else
                            <th>{{ __('Items') }}</th>
                          @endif
                          @if($saleInvoiceData->has_hsn)
                            <th width="5%" class="text-center">{{ __('HSN') }}</th>
                          @endif
                          @if($saleInvoiceData->invoice_type=='hours')
                            <th width="5%" class="text-center">{{ __('Hours') }}</th>
                            <th width="8%" class="text-center">{{ __('Rate') }}</th>
                          @else
                            <th width="5%" class="text-center">{{ __('Quantity') }}</th>
                            <th width="8%" class="text-center">{{ __('Price') }}({{ isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '' }})</th>
                          @endif
                          @if($saleInvoiceData->has_item_discount)
                            <th class="text-center" width="5%">{{ __('Discount') }}</th>
                          @endif
                          @if($saleInvoiceData->has_tax)
                            <th width="10%" class="text-center">{{ __('Tax') }} (%) </th>
                          @endif
                          <th width="10%" class="text-center">
                            {{ __('Total') }} ({{ isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '' }})
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        @php
                          $itemsInformation = '';
                          $row = 6;
                          $currentTaxArray = [];
                          if ($saleInvoiceData->invoice_type == 'amount') {
                            $row = $row - 2;
                          }
                          if (!$saleInvoiceData->has_item_discount) {
                            $row = $row - 1;
                          }
                          if (!$saleInvoiceData->has_hsn) {
                            $row = $row - 1;
                          }
                          if (!$saleInvoiceData->has_tax) {
                            $row = $row - 1;
                          }
                        @endphp
                        @if ( count ($saleInvoiceData->saleOrderDetails) > 0 )
                          @php $subTotal = $totalDiscount = 0; @endphp
                          @foreach ($saleInvoiceData->saleOrderDetails as $result)
                            @php
                              $priceAmount = ($result->quantity * $result['unit_price']);
                              $subTotal += $priceAmount;
                            @endphp
                            @if($result->quantity > 0)
                              <tr>
                                <td class="white-space-unset">
                                  <span class="break-all f-16">
                                    {{ $result->item_name }}
                                  </span> <br/>
                                  @if($saleInvoiceData->has_description && $result->description)
                                    <span class="break-all f-13">
                                      {{ $result->description }}
                                    </span>
                                  @endif
                                </td>
                                @if($saleInvoiceData->has_hsn)
                                  <td width="5%" class="white-space-unset text-center">{{ $result->hsn }}</td>
                                @endif
                                @if($saleInvoiceData->invoice_type != 'amount')
                                  <td width="5%" class="white-space-unset text-center">{{ formatCurrencyAmount($result->quantity) }}</td>
                                @endif
                                <td width="8%" class="white-space-unset text-center">{{ formatCurrencyAmount($result->unit_price) }}</td>
                                @if($saleInvoiceData->has_item_discount)
                                  <td width="5%" class="white-space-unset text-center">{{ formatCurrencyAmount($result->discount) }}{{ $result->discount_type }}</td>
                                @endif
                                @if($saleInvoiceData->has_tax)
                                  <td width="10%" class="white-space-unset text-center">
                                    @foreach ( json_decode($result->taxList) as $counter => $tax)
                                      {{ formatCurrencyAmount($tax->rate) }}%
                                      @if( $counter < count( json_decode($result->taxList) ) - 1 )
                                        ,
                                      @endif
                                    @endforeach
                                  </td>
                                @endif
                                <td align="right" class="white-space-unset">{{ formatCurrencyAmount($priceAmount, isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}</td>
                              </tr>
                            @endif
                          @endforeach
                          <tr class="tableInfos">
                            <td colspan="{{ $row }}" align="right">{{ __('Sub Total') }}</td>
                            <td align="right" colspan="1">{{ formatCurrencyAmount($subTotal, $saleInvoiceData->currency->symbol) }}</td>
                          </tr>
                          @if($saleInvoiceData->has_item_discount)
                            <tr class="tableInfos">
                              <td colspan="{{ $row }}" align="right">{{ __('Discount') }}</td>
                              <td align="right" colspan="1">{{ formatCurrencyAmount($saleInvoiceData->saleOrderDetails->sum('discount_amount'), isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}</td>
                            </tr>
                          @endif
                          @forelse($taxes as $tax)
                            <tr>
                                <td colspan="{{$row}}" align="right">{{$tax['name']}} : {{ formatCurrencyAmount($tax['rate']) }}% </td>
                                <td colspan="1" class="text-right">{{ formatCurrencyAmount($tax['amount'], isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}</td>
                            </tr>
                          @empty
                          @endforelse

                          @if($saleInvoiceData->has_other_discount == 1)
                            <tr class="tableInfos">
                              @php
                                if ($saleInvoiceData->has_item_discount == 1) {
                                  if($saleInvoiceData->other_discount_type == "$"){
                                    $otherDiscount = $saleInvoiceData->other_discount_amount;
                                  } else {
                                    $otherDiscount = ($subTotal - $saleInvoiceData->saleOrderDetails->sum('discount_amount')) * $saleInvoiceData->other_discount_amount / 100;
                                  }
                                } else {
                                  if($saleInvoiceData->other_discount_type == "$"){
                                    $otherDiscount = $saleInvoiceData->other_discount_amount;
                                  } else {
                                    $otherDiscount = $subTotal * $saleInvoiceData->other_discount_amount / 100;
                                  }
                              }
                              @endphp
                              <td colspan="{{ $row }}" align="right">
                                {{ __('Other discount') }} : {{   formatCurrencyAmount($saleInvoiceData->other_discount_amount) }}{{ $saleInvoiceData->other_discount_type == '$' ? $saleInvoiceData->currency->symbol : '%' }}
                              </td>
                              <td align="right">{{ formatCurrencyAmount($otherDiscount, isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}</td>
                            </tr>
                          @endif

                          @if($saleInvoiceData->has_shipping_charge && $saleInvoiceData->shipping_charge)
                            <tr class="tableInfos">
                              <td colspan="{{ $row }}" align="right">{{ __('Shipping') }}</td>
                                <td align="right" colspan="1">{{ formatCurrencyAmount($saleInvoiceData->shipping_charge, isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}</td>
                            </tr>
                          @endif

                          @if($saleInvoiceData->has_custom_charge)
                            <tr class="tableInfos">
                              <td colspan="{{ $row }}" align="right">{{ $saleInvoiceData->custom_charge_title }}</td>
                              <td align="right" colspan="1">{{ formatCurrencyAmount($saleInvoiceData->custom_charge_amount, isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}</td>
                            </tr>
                          @endif

                          <tr class="tableInfos">
                            <td colspan="{{ $row }}" align="right">
                              <strong>{{ __('Grand Total') }}</strong></td>
                            <td colspan="1" class="text-right">
                              <strong>{{ formatCurrencyAmount($saleInvoiceData->total, isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}</strong>
                            </td>
                          </tr>
                          <tr class="tableInfos">
                            <td colspan="{{ $row }}" align="right">{{ __('Paid') }}</td>
                            <td colspan="1" class="text-right">
                              {{ formatCurrencyAmount($saleInvoiceData->paid, isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}
                            </td>
                          </tr>
                          <tr class="tableInfos">
                            <td colspan="{{ $row }}" align="right">
                              <strong>{{ __('Due') }}</strong>
                            </td>

                            <td colspan="1" class="text-right">
                              <strong>
                                @if($saleInvoiceData->total >= $saleInvoiceData->paid)
                                  {{ formatCurrencyAmount(abs($saleInvoiceData->total - $saleInvoiceData->paid), isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}
                                @else
                                  -{{ formatCurrencyAmount(abs($saleInvoiceData->total - $saleInvoiceData->paid), isset($saleInvoiceData->currency->symbol) ? $saleInvoiceData->currency->symbol : '') }}
                                @endif
                              </strong>
                            </td>
                          </tr>
                        @endif
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      @if (count($files) > 0)
        <div class="{{ $saleInvoiceData->comment ? 'col-sm-7' : 'col-sm-12' }}">
          <div class="card">
            <div class="card-header logo-position-remove">
              <h5 class="p-2">{{ __('Files') }}</h5>
            </div>
            <div class="card-body">
              <div class="row pt-4 pb-4 px-3">
                @foreach ($files as $file)
                  @php
                    $url = url('public/dist/js/html5lightbox/no_preview.png?v'). $file->id;
                    $extra = '';
                    $div = '';
                    $fileName = !empty($file->original_file_name) ? $file->original_file_name : $file->file_name;
                    if (in_array($file->extension, array('jpg', 'png', 'jpeg', 'gif', 'pdf', 'flv', 'webm', 'mp4', 'ogv', 'swf', 'm4v', 'ogg'))) {
                      $url = url($filePath) .'/'. $file->file_name;
                    } elseif (in_array($file->extension, array('csv', 'xls', 'xlsx', 'doc', 'docx', 'ppt', 'pptx', 'txt'))) {
                      $url = '#pdiv-'. $file->id;
                      $extra = 'data-width=900 data-height=600';
                      $div = '<div id="pdiv-'. $file->id .'" class="display_none">
                                <div class="lightboxcontainer">
                                  <iframe width="100%" height="100%" src="//docs.google.com/gview?url='. url($filePath) .'/'. $file->file_name .'&embedded=true" frameborder="0" allowfullscreen></iframe>
                                  <div class="clear_both"></div>
                                </div>
                              </div>';
                    }
                  @endphp
                  <a <?= $extra ?> href="{{ $url }}" data-attachment="<?= $file->id; ?>" class="html5lightbox" title="{{ $fileName }}" data-group="{{ $saleInvoiceData->reference }}">
                    <div class="previewer-file-total-div">
                      <div class="previewer-file-thumbnail-div">
                        @if (in_array($file->extension, array('jpg', 'png', 'jpeg', 'gif')))
                          <img class="previewer-thumbnail-size" src="{{ $url }}">
                        @else
                          <i class="{{ $file->icon }} center f-50 previewer-icon-position" style="color:{{ setColor($file->extension) }};" aria-hidden="true"></i>
                        @endif
                      </div>
                      <div class="previewer-file-name-div">
                        <div>
                          <i class="{{ $file->icon }} f-20" style="color:{{ setColor($file->extension) }};" aria-hidden="true"></i>
                          <span class="f-12 previewer-file-name">{{ strlen($fileName) > 15 ? substr_replace($fileName, "..", 15) : $file->original_file_name }}
                          </span>
                        </div>
                      </div>
                    </div>
                  </a>
                  <?= $div ?>
                @endforeach
              </div>
            </div>
          </div>
        </div>
      @endif
      @if($saleInvoiceData->has_comment == 1 && !empty($saleInvoiceData->comment))
        <div class="{{ count($files) > 0 ? 'col-sm-5' : 'col-sm-12' }}">
          <div class="card">
            <div class="card-header">
              <h5>{{ __('Note') }}</h5>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <div class="text-justify">
                      {{ $saleInvoiceData->comment }}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      @endif
    </div>
  </div>  
</div>


 <!--Pay Modal Start-->
 <div class="modal fade" id="payModal" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">{{ __('Bank Payment') }}</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body mx-5">
        <form class="form-horizontal" id="payForm" action="{{ url('bank/payment') }}" method="POST" enctype="multipart/form-data">
          <input type="hidden" value="{{ csrf_token() }}" name="_token">
          <input type="hidden" name="invoice_reference" value="{{ $saleInvoiceData->reference }}">
          <input type="hidden" name="order_reference" value="{{ $reference }}">
          <input type="hidden" name="customer_id" id="customer_id" value="{{ $saleInvoiceData->customer_id }}">
          <input type="hidden" name="project_id" value="{{ $saleInvoiceData->project_id }}">
          <input type="hidden" name="order_no" value="{{ base64_encode($saleInvoiceData->id) }}">
          <input type="hidden" name="payment_type" value="invoice">
          <input type="hidden" name="invoice_currency_id" value="{{ $saleInvoiceData->currency->id }}">
          <input type="hidden" name="toCurrency" value="{{ !empty($accountInfo) ?  $accountInfo->currency->id : '' }}">
          <input type="hidden" name="accountId" value="{{ !empty($accountInfo) ?  $accountInfo->id : '' }}">
          <input type="hidden" name="send_amount" value="{{ $saleInvoiceData->total - $saleInvoiceData->paid }}">


          <div class="row">
            <label for="reference" class="col-sm-4 control-label">{{ __('Account Name') }}</label>
            <div class="col-sm-6">
              <span>{{ !empty($accountInfo) ?  $accountInfo->name : '' }} ({{ !empty($accountInfo) ?  $accountInfo->currency->name : '' }})</span>
            </div>
          </div>

          <div class="row">
            <label for="reference" class="col-sm-4 control-label">{{ __('Account Number') }}</label>
            <div class="col-sm-6">
              <span>{{ !empty($accountInfo) ?  $accountInfo->account_number : '' }}</span>
            </div>
          </div>

          <div class="row">
            <label for="reference" class="col-sm-4 control-label">{{ __('Bank Name') }}</label>
            <div class="col-sm-6">
              <span>{{ !empty($accountInfo) ?  $accountInfo->bank_name : '' }}</span>
            </div>
          </div> <br>

          <div class="form-group row">
            <label for="amount" class="col-sm-4 control-label">{{ __('Amount') }}  </label>
            <div class="col-sm-6">
              <div class="input-group">
                <input type="text" placeholder="Amount" class="form-control positive-float-number" id="amount" name="amount" value="{{ formatCurrencyAmount($saleInvoiceData->total-$saleInvoiceData->paid) }}" readonly="">
                <div class="input-group-prepend">
                  <span class="input-group-text" id="amount_currency_code">{{ $saleInvoiceData->currency->name}}</span>
                  <input type="hidden" id="currency-symbol" value="{{ $saleInvoiceData->currency->name }}">
                </div>
              </div>
            </div>
          </div>

          <div class="form-group row">
            <label for="payment_date" class="col-sm-4 control-label require">{{ __('Date') }}</label>
            <div class="col-sm-6">
               <input type="text" name="payment_date" class="form-control" id="payment_date" placeholder="{{ __('Paid On') }}">
            </div>
          </div>

          <div class="form-group row">
            <label for="reference" class="col-sm-4 control-label">{{  __('Description')  }} </label>
            <div class="col-sm-6">
              <input type="text" name="description" class="form-control" id="description" placeholder="{{  __('Description')  }}" value="Payment for {{ $saleInvoiceData->reference }} " readonly>
            </div>
          </div>

          <div class="form-group row">
            <label for="reference" class="col-sm-4 control-label">{{  __('Reference')  }} </label>
            <div class="col-sm-6">
               <input type="text" name="reference" class="form-control" id="reference" value="{{ $reference }}"  placeholder="{{  __('Reference')  }}" readonly>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-4 control-label" for="attachment">{{ __('Attachment')  }}</label>
            <div class="dropzone-attachments col-sm-6 ml-3">
              <div class="event-attachments">
                <div class="add-attachments"><i class="fa fa-plus"></i></div>
              </div>
            </div>
          </div>
          <div class="form-group row">
            <div class="col-sm-4"></div>
            <div class="col-sm-6" id="uploader-text"></div>
          </div>

          <div class="form-group row">
            <div class="col-sm-4"></div>
            <div class="col-sm-6 mt-5">
              <span class="badge badge-danger">{{ __('Note') }}!</span> {{ __('Allowed File Extensions: jpg, png, gif, docx, xls, xlsx, csv and pdf') }}
            </div>
          </div>

          <div class="format row">
            <label id="error-msg" class="text-danger display_none"></label>
          </div>

          <div class="form-group row">
            <div class="col-sm-offset-3 col-sm-6">
              <button type="submit" class="btn btn-primary btn-flat custom-btn-small" id="pay-button">{{ __('Pay Now')  }}</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--Pay Modal End-->
<div class="modal fade" id="stripe" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content p-2">
      <div class="modal-header p-1">
        <h3 class="panel-title display-td pt-1" >{{ __('Payment Details') }}</h3>
          <div class="display-td" >                            
              <img class="img-responsive float-right" src="{{ asset('stripe.png') }}">
          </div>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12 col-md-offset-3">
            <div class="panel panel-default credit-card-box">
              <div class="panel-heading display-table" >
                <div class="row display-tr"></div>                    
              </div>
              <div class="panel-body">
                <div class="stripe-elements">
                  <div class="row form-group error-alert" id="card-errors">
                  </div>
                  <form action="{{ route('stripe.post') }}" method="post" id="payment-form">
                    {{ csrf_field() }}
                    <div class="row pt-2">
                      <div class="field">
                        <div id="card-number" class="input empty"></div>
                        <label for="card-number">{{ __('Card Number') }}</label>
                        <div class="baseline"></div>
                      </div>
                    </div>
                    <div class="row pt-2 pb-2">
                      <div class="field half-width">
                        <div id="card-expiry" class="input empty"></div>
                        <label for="card-expiry">{{ __('Expiration') }}</label>
                        <div class="baseline"></div>
                      </div>
                      <div class="field half-width">
                        <div id="card-cvc" class="input empty"></div>
                        <label for="card-cvc">{{ __('CVC') }}</label>
                        <div class="baseline"></div>
                      </div>
                    </div>
                    <div class="row pt-2">
                      <button class="btn btn-primary btn-lg btn-block" id="stripe-submit-btn" type="submit">
                         <i class="fa fa-spinner fa-spin display_none"></i>
                         <span id="stripe-submit-btn-text">{{ __('Pay Now') }} ({{ $saleInvoiceData->currency->symbol.($saleInvoiceData->total-$saleInvoiceData->paid) }})</span>
                      </button>
                    </div>
                    <input type="hidden" name="stripeAmount" value="{{ $saleInvoiceData->total-$saleInvoiceData->paid }}">
                    <input type="hidden" name="stripeCurencyName" value="{{ isset($saleInvoiceData->currency->name) ? $saleInvoiceData->currency->name : '' }}">
                    <input type="hidden" name="stripeCurencyId" value="{{ isset($saleInvoiceData->currency->id) ? $saleInvoiceData->currency->id : '' }}">
                    <input type="hidden" name="stripeInvoiceId" value="{{ $saleInvoiceData->id }}">
                    <input type="hidden" name="stripeReference" value="{{ $reference }}">
                    <input type="hidden" name="stripeCustomerId" value="{{ $saleInvoiceData->customer_id }}">
                  </form>
                </div>
              </div>
            </div>        
          </div>
        </div>  
      </div>
    </div>
  </div>
</div>
@endsection
@section('js')

<script src="{{ asset('public/datta-able/plugins/select2/js/select2.full.min.js') }}"></script>
<script src="{{ asset('public/dist/js/moment.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/dropzone/dropzone.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('public/dist/js/html5lightbox/html5lightbox.js?v=1.0') }}"></script>
<script src="{{ asset('public/dist/js/jquery.validate.min.js') }}"></script>
<script src="{{ url('https://js.stripe.com/v3/') }}"></script>
{!! translateValidationMessages() !!}
<script>
  "use strict";
  var publishableKey = '{{ $publishableKey }}';
  var dflt_currency_id = {!!$saleInvoiceData->currency_id!!};
  var invoiceCurrencyName = '{!! $saleInvoiceData->currency->name !!}';
  var due = {!!$saleInvoiceData->total - $saleInvoiceData-> paid!!};
</script>
<script src="{{ asset('public/dist/js/custom/customerpanel.min.js') }}"></script>
@endsection