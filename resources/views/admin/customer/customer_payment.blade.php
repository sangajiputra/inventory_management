@extends('layouts.app')
@section('css')
  <link rel="stylesheet" href="{{ asset('public/dist/plugins/Responsive-2.2.5/css/responsive.dataTables.css') }}">
  <link rel="stylesheet" href="{{ asset('public/datta-able/plugins/select2/css/select2.min.css') }}">
  <!-- daterange picker -->
  <link rel="stylesheet" href="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.css') }}">
@endsection
@section('content')
<!-- Main content -->
<div class="col-sm-12" id="customer-payments-container">
  <div class="card">
    <div class="card-header">
      <h5><a href="{{ url('customer/list') }}">{{ __('Customers') }}</a> >> {{ $customerData->first_name }} {{ $customerData->last_name }} >> {{ __('Payments')  }}</h5>
      <div class="card-header-right">
        
      </div>
    </div>
    <div class="card-body p-0" id="no_shadow_on_card">
    @include('admin.customer.customer_tab')
      <div class="col-sm-12">
        <form class="form-horizontal" action="{{ url('customer/payment/'. $customerData->id) }}" method="GET" id='orderListFilter'>
          <input class="form-control" id="startfrom" type="hidden" name="from" value="<?= isset($from) ? $from : '' ?>">
          <input class="form-control" id="endto" type="hidden" name="to" value="<?= isset($to) ? $to : '' ?>">
          <input type="hidden" name="customer" id="customer" value="{{ $customerData->id }}">
          <div class="col-md-12 col-sm-12 col-xs-12 m-l-10 margin-btm-05p">
            <div class="row mt-3">
              <div class="col-md-4 col-sm-4 col-xs-12 mb-2">
                <div class="input-group">
                  <button type="button" class="form-control" id="daterange-btn">
                    <span class="float-left">
                      <i class="fa fa-calendar"></i>  {{ __('Pick a date range') }}
                    </span>
                    <i class="fa fa-caret-down float-right pt-1"></i>
                  </button>
                </div>
              </div>
               <div class="col-md-4 col-sm-3 col-xs-11 mb-2">
                <div class="input-group">
                  <select class="form-control select2" name="method" id="method">
                    <option value="">{{ __('All methods') }}</option>
                    @if(!empty($methodList))
                      @foreach($methodList as $methodItem)
                        <option value="{{ $methodItem->id }}" <?= ($methodItem->id == $method) ? 'selected' : ''?>>{{ $methodItem->name }}</option>
                      @endforeach
                    @endif
                  </select>
                </div>
              </div>
              <div class="col-md-3 col-sm-3 col-xs-11 mb-2">
                <select class="form-control select2" name="currency" id="currency">
                  <option value="">{{ __('All currencies') }}</option>
                  @if(!empty($currencyList))
                    @foreach($currencyList as $currencyData)
                      <option value="{{$currencyData->id}}" <?= ($currencyData->id == $currency) ? 'selected' : ''?>>{{ $currencyData->name }}</option>
                    @endforeach
                  @endif
                </select>
              </div>
              <div class="col-md-1 col-sm-1 col-xs-12 p-md-0">
                <button type="submit" name="btn" title="Click to filter" class="btn btn-primary custom-btn-small push-sm-right mt-0 mr-0">{{ __('Go') }}</button>
              </div>
            </div> 
          </div>
        </form>
      </div>
      <div class="card-block">
          <div class="col-sm-12">
            <div class="table-responsive">
              {!! $dataTable->table(['class' => 'table table-striped table-hover dt-responsive', 'width' => '100%', 'cellspacing' => '0']) !!}
            </div>
        </div>
      </div>
    </div>
     <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="confirmDeleteLabel"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('Close') }}">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary custom-btn-small" data-dismiss="modal">{{ __('Close') }}</button>
          <button type="button" id="confirmDeleteSubmitBtn" data-task="" class="btn btn-danger custom-btn-small">{{ __('Submit') }}</button>
          <span class="ajax-loading"></span>
        </div>
      </div>
    </div>
  </div>
  </div>
</div>
  @include('layouts.includes.message_boxes')
@endsection


@section('js')

<script src="{{ asset('public/dist/plugins/DataTables-1.10.21/js/jquery.dataTablesCus.min.js') }}"></script>
<script src="{{ asset('public/datta-able/plugins/select2/js/select2.full.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/Responsive-2.2.5/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('public/dist/js/moment.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.min.js') }}"></script>
{!! $dataTable->scripts() !!}
<script type="text/javascript">
  "use strict";
  var startDate = "{!! isset($from) ? $from : 'undefined' !!}";
  var endDate   = "{!! isset($to) ? $to : 'undefined' !!}";
</script>
<script src="{{ asset('public/dist/js/custom/customer.min.js') }}"></script>
@endsection