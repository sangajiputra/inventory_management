@extends('layouts.app3')

@section('css')
<link rel="stylesheet" type="text/css" href="{{ asset('public/dist/css/invoice-style.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('public/dist/css/external-link.min.css') }}">
@endsection

@section('content')
<div class="col-sm-12 m-t-30" id="sales-quotation-view-details-container">
  <div class="row">
    <div class="col-sm-12">
      <div class="card mx-4">
        <div class="card-header row justify-content-between">
        </div>
        <div class="card-body mx-3 m-5">
          <div class="m-t-10">
            <div class="row m-t-10 ml-2">
              <div class="col-md-4 m-b-15">
                <h6>#{{ $saleOrderData->reference }}</h6>
                <strong class="text-black">{{ $company_name }}</strong><br>
                <strong>{{ $company_street }}</strong><br>
                <strong>{{ $company_city }}, {{ $company_state }}</strong><br>
                <strong>{{ $company_country_name }}, {{ $company_zipCode }}</strong><br>
              </div>
              <div class="col-md-4 m-b-15">
                <strong class="text-black">{{ __('Bill To') }}</strong><br>
                <strong class="text-black">{{ isset($saleOrderData->customer->first_name) ? $saleOrderData->customer->first_name : '' }} {{ isset($saleOrderData->customer->last_name) ? $saleOrderData->customer->last_name : '' }}</strong><br>
                <strong>{{ isset($saleOrderData->customerBranch->billing_street) ? $saleOrderData->customerBranch->billing_street : '' }} </strong><br>
                <strong>{{ isset($saleOrderData->customerBranch->billing_state) ? $saleOrderData->customerBranch->billing_state : '' }}{{ isset($saleOrderData->customerBranch->billing_city) ? ', ' . $saleOrderData->customerBranch->billing_city : '' }}</strong><br>
                  <strong>{{ isset($saleOrderData->customerBranch->billingCountry) ? $saleOrderData->customerBranch->billingCountry->name : '' }} {{ isset($saleOrderData->customerBranch->billing_zip_code) ? ', ' . $saleOrderData->customerBranch->billing_zip_code : '' }}</strong><br>
              </div>
              <div class="col-md-3 m-b-15">
                <strong>{{ __('Quotation Date') }} : {{ formatDate($saleOrderData->order_date) }}</strong><br>
                <strong>{{ __('Location') }} : {{ isset($saleOrderData->location->name) ? $saleOrderData->location->name : '' }}</strong><br class="mb-1">
              </div>
              <div class="col-md-1 m-b-15">
                <a target="_blank" href="{{ URL::to('/') }}/order/external-print-pdf/{{ $id }}?type=pdf" title="PDF" class="btn custom-btn-small btn-outline-secondary">{{ __('PDF') }}</a>
              </div>
            </div>
            <div class="row mt-0">
              <div class="col-md-12">
                <div class="table-responsive">
                  <table class="table table-bordered" id="salesInvoice">
                    <tbody>
                      <tr class="tbl_header_color dynamicRows">
                        <th>{{ __('Items') }}</th>
                        @if($saleOrderData->has_hsn)
                          <th width="5%" class="text-center">{{ __('HSN') }}</th>
                        @endif
                        @if($saleOrderData->invoice_type=='hours')
                          <th width="5%" class="text-center">{{ __('Hrs') }}</th>
                          <th width="8%" class="text-center">{{ __('Rate') }}</th>
                        @else
                          <th width="5%" class="text-center">{{ __('Qnt') }}</th>
                          <th width="8%" class="text-center">{{ __('Price') }}({{ isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : ''}})</th>
                        @endif
                        @if($saleOrderData->has_item_discount)
                          <th class="text-center" width="5%">{{ __('Discount') }}</th>
                        @endif
                        @if($saleOrderData->has_tax)
                          <th width="10%" class="text-center">{{ __('Tax') }} (%) </th>
                        @endif
                        <th width="10%" class="text-center" id="order-total">
                          Total ({{ isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '' }})
                        </th>
                      </tr>
                      @php
                        $itemsInformation = '';
                        $row = 6;
                        $currentTaxArray = [];
                        if ($saleOrderData->invoice_type == 'amount') {
                          $row = $row - 2;
                        }
                        if (!$saleOrderData->has_item_discount) {
                          $row = $row - 1;
                        }
                        if (!$saleOrderData->has_hsn) {
                          $row = $row - 1;
                        }
                        if (!$saleOrderData->has_tax) {
                          $row = $row - 1;
                        }
                      @endphp
                      @if ( count($saleOrderData->saleOrderDetails) > 0 )
                        @php $subTotal = $totalDiscount = 0; @endphp
                        @foreach ($saleOrderData->saleOrderDetails as $result)
                          @php
                            $priceAmount = ($result->quantity * $result->unit_price);
                            $subTotal += $priceAmount;
                          @endphp
                          @if ($result->quantity > 0 )
                            <tr>
                              <td class="white-space-unset">
                                <span class="break-all f-16">
                                  {{$result['item_name']}}
                                </span> <br/>
                                @if($saleOrderData->has_description && $result->description)
                                  <span class="break-all f-13">
                                    {{ $result->description }}
                                  </span>
                                @endif
                              </td>
                              @if( $saleOrderData->has_hsn )
                                <td width="5%" class="white-space-unset text-center"> {{ $result->hsn }}</td>
                              @endif
                              @if( $saleOrderData->invoice_type != 'amount' )
                                <td width="5%" class="white-space-unset text-center">{{ formatCurrencyAmount($result->quantity) }} </td>
                              @endif
                              <td width="8%" class="white-space-unset text-center">{{ formatCurrencyAmount($result->unit_price) }}</td>
                              @if( $saleOrderData->has_item_discount )
                                <td width="5%" class="white-space-unset text-center">{{ formatCurrencyAmount($result->discount) }}{{ $result->discount_type }}</td>
                              @endif
                              @if( $saleOrderData->has_tax )
                                <td width="10%" class="white-space-unset text-center">
                                  @forelse(json_decode($result->taxList) as $counter => $tax)
                                    {{ formatCurrencyAmount($tax->rate) }}%
                                  @empty
                                  @endforelse
                                </td>
                              @endif
                              <td width="10%" align="right" class="white-space-unset">{{ formatCurrencyAmount($priceAmount) }}</td>
                            </tr>
                          @endif
                        @endforeach
                        <tr class="tableInfos">
                          <td colspan="{{ $row }}" align="right">{{ __('Sub Total') }}</td>
                          <td align="right" colspan="1">{{ formatCurrencyAmount($subTotal, isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}</td>
                        </tr>
                        @if($saleOrderData->has_item_discount)
                          <tr class="tableInfos">
                            <td colspan="{{ $row }}" align="right">{{ __('Discount') }}</td>
                            <td align="right" colspan="1">{{ formatCurrencyAmount( $saleOrderData->saleOrderDetails->sum('discount_amount'), isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}</td>
                          </tr>
                        @endif

                        @forelse($taxes as $tax)
                          <tr>
                              <td colspan="{{ $row }}" align="right">{{$saleOrderData->tax_type == 'inclusive' ? 'Including ' : ''}}  {{ $tax['name'] }} : {{ formatCurrencyAmount($tax['rate']) }}% </td>
                              <td colspan="1" class="text-right">{{ formatCurrencyAmount(($tax['amount']), isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}</td>
                          </tr>
                        @empty
                        @endforelse

                        @if($saleOrderData->has_other_discount)
                          <tr class="tableInfos">
                            @php
                              if ($saleOrderData->other_discount_type == "$") {
                                $otherDiscount = $saleOrderData->other_discount_amount;
                              } else {
                                $otherDiscount = $subTotal * $saleOrderData->other_discount_amount / 100;
                              }
                            @endphp
                            <td colspan="{{ $row }}" align="right">
                              {{ __('Other Discount') }} : {{ formatCurrencyAmount($saleOrderData->other_discount_amount) }}{{ $saleOrderData->other_discount_type == '$' && isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '%' }}
                            </td>
                            <td align="right">{{ formatCurrencyAmount($otherDiscount, isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}</td>
                          </tr>
                        @endif

                        @if($saleOrderData->has_shipping_charge && $saleOrderData->shipping_charge)
                          <tr class="tableInfos">
                            <td colspan="{{ $row }}" align="right">{{ __('Shipping') }}</td>
                            <td align="right" colspan="1">{{ formatCurrencyAmount($saleOrderData->shipping_charge, isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}</td>
                          </tr>
                        @endif

                        @if($saleOrderData->has_custom_charge)
                          <tr class="tableInfos">
                            <td colspan="{{ $row }}" align="right">{{ $saleOrderData->custom_charge_title }}</td>
                            <td align="right" colspan="1">{{ formatCurrencyAmount($saleOrderData->custom_charge_amount, isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}</td>
                          </tr>
                        @endif

                        <tr class="tableInfos">
                          <td colspan="{{ $row }}" align="right">
                            <strong>{{ __('Grand Total') }}</strong></td>
                          <td class="text-right">
                            <strong>{{ formatCurrencyAmount($saleOrderData->total, isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}</strong>
                          </td>
                        </tr>

                        <tr class="tableInfos">
                          <td colspan="{{ $row }}" align="right">{{ __('Paid') }}</td>
                          <td class="text-right">
                            {{ formatCurrencyAmount($saleOrderData->paid, isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}
                          </td>
                        </tr>
                        
                        <tr class="tableInfos">
                          <td colspan="{{ $row }}" align="right">
                            <strong>{{ __('Due') }}</strong>
                          </td>
                          <td class="text-right">
                            <strong>
                              @if($saleOrderData->total < $saleOrderData->paid)
                                -
                              @endif
                              {{ formatCurrencyAmount(abs($saleOrderData->total-$saleOrderData->paid), isset($saleOrderData->currency->symbol) ? $saleOrderData->currency->symbol : '') }}
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
      <div class="{{ $saleOrderData->comment ? 'col-sm-7' : 'col-sm-12'}}">
        <div class="card mx-4">
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
                @if(file_exists($filePath .'/'. $file->file_name))
                <a <?= $extra ?> href="{{ $url }}" data-attachment="<?= $file->id; ?>" class="html5lightbox" title="{{ $fileName }}" data-group="{{ $saleOrderData->reference }}">
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
                @endif
              @endforeach
            </div>
          </div>
        </div>
      </div>
    @endif
    @if($saleOrderData->has_comment == 1 && $saleOrderData->comment)
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
                    {{ $saleOrderData->comment }}
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

<!--Modal start-->

<!--Modal end -->
@include('layouts.includes.message_boxes')
@endsection
@section('js')
<script type="text/javascript" src="{{ asset('public/dist/js/html5lightbox/html5lightbox.js?v=1.0') }}"></script>
<script src="{{ asset('public/dist/js/jquery.validate.min.js') }}"></script>
{!! translateValidationMessages() !!}
<script type="text/javascript">
'use strict';
var phoneNumber = "{{ isset($saleOrderData->customer->phone) ? $saleOrderData->customer->phone : '' }}";
</script>
<script src="{{ asset('public/dist/js/custom/sales-purchase.min.js') }}"></script>
<script src="{{ asset('public/dist/js/custom/sales.min.js') }}"></script>
@endsection