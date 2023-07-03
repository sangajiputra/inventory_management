@extends('layouts.app')
@section('css')
<link rel="stylesheet" href="{{ asset('public/datta-able/fonts/material/css/materialdesignicons.min.css') }}">
<link rel="stylesheet" href="{{ asset('public/dist/plugins/Responsive-2.2.5/css/responsive.dataTables.css') }}">
<link rel="stylesheet" href="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.css') }}">
<link rel="stylesheet" href="{{ asset('public/datta-able/plugins/select2/css/select2.min.css') }}">
@endsection

@section('content')
<!-- Main content -->
<div class="col-sm-12">
  <div class="card">
    <div class="card-body p-3 m-0">
      <form class="form-horizontal" action="{{ url('dashboard') }}" method="GET" accept-charset="UTF-8" id="dashboardForm">
        <input class="form-control" id="startfrom" type="hidden" name="from" value="<?= isset($from) ? $from : '' ?>">
        <input class="form-control" id="endto" type="hidden" name="to" value="<?= isset($to) ? $to : '' ?>">
        @php
          $from = isset($from)?$from:'';
          $to = isset($to)?$to:'';
          $invoiceSummery['overDue'] = abs($invoiceSummery['overDue']);
        @endphp
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12 m-l-10">
          <div class="row mt-1">
            <div class="col-md-12 col-xl-4 col-lg-4 col-sm-12 col-xs-12 mb-2 pl-0">
              <div class="input-group">           
                <button type="button" class="form-control" id="daterange-btn">
                  <span class="float-left">
                    <i class="fa fa-calendar"></i> {{ __('Date range picker') }}
                  </span>
                  <i class="fa fa-caret-down float-right pt-1"></i>
                </button> 
              </div>           
            </div>
            <div class="offset-md-6 col-md-12 col-xl-2 col-lg-2 col-sm-12 col-xs-12 mb-2 pl-0" id="currencySelector">
              <select class="form-control select2" name="currency" id="currency">
                @if(!empty($currencyList))
                  @foreach($currencyList as $currencyData)
                    <option value="{{$currencyData->id}}" <?= ($currencyData->id == $currency->id) ? 'selected' : ''?>>{{$currencyData->name}}</option>
                  @endforeach
                @endif
              </select>
            </div> 
          </div>
        </div>
      </form>
    </div>
    @if(Helpers::has_permission(Auth::user()->id, 'manage_invoice|own_invoice'))
    <div class="card-block p-0">
      <div class="card">
        <div class="card-header">
          <h5>{{ __('Invoice Overview') }}</h5>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-sm-6 p-0">
              <div class="row">
                <div class="col-sm-12">
                  <div class="card theme-bg bitcoin-wallet">
                    <div class="card-block minimize-padding-space">
                      <h5 class="text-white mb-2">{{ __('Total Amount') }}</h5>
                      <h6 class="text-white mb-2 f-w-200"><strong> {{ formatCurrencyAmount(isset($invoiceSummery['totalInvoice']) ?  $invoiceSummery['totalInvoice'] : 0, $currencySymbol) }}</strong></h6>
                      <i class="fas fa-money-check-alt f-20 text-white float-right"></i>                    
                    </div>
                  </div>
                </div>
                <div class="col-sm-12">
                  <div class="card theme-bg2 bitcoin-wallet">
                    <div class="card-block minimize-padding-space">
                      <h5 class="text-white mb-2">{{ __('Total Paid') }}</h5>
                      <h6 class="text-white mb-2 f-w-300"><strong> {{ formatCurrencyAmount(isset($invoiceSummery['totalPaid']) ?  $invoiceSummery['totalPaid'] : 0, $currencySymbol) }}</strong></h6>
                      <i class="fas fa-money-check-alt f-20 text-white float-right"></i>                    
                    </div>
                  </div>
                </div>
                <div class="col-sm-12">
                  <div class="card theme-bg-y bitcoin-wallet">
                    <div class="card-block minimize-padding-space">
                      <h5 class="text-white mb-2">{{ __('Total Due') }}</h5>
                      <h6 class="text-white mb-2 f-w-300"><strong>
                      {{ formatCurrencyAmount(isset($invoiceSummery['totalDue']) ?  $invoiceSummery['totalDue'] : 0, $currencySymbol) }}</strong></h6>  
                      <i class="fas fa-money-check-alt f-20 text-white float-right"></i>                    
                    </div>
                  </div>
                </div>
                <div class="col-sm-12">
                  <div class="card theme-bg-r bitcoin-wallet">
                    <div class="card-block minimize-padding-space">
                      <h5 class="text-white mb-2">{{ __('Over Due') }}</h5>
                      <h6 class="text-white mb-2 f-w-300"><strong>
                      {{ formatCurrencyAmount(isset($invoiceSummery['overDue']) ?  $invoiceSummery['overDue'] : 0, $currencySymbol) }}</strong></h6>  
                      <i class="fas fa-money-check-alt f-20 text-white float-right"></i>                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-6 p-1">
                <canvas class="float-right canvas-height-width chartPieOne" id="chart-pie-1"></canvas>
            </div> 
          </div>
        </div>
      </div>
    </div>
    @endif


    @if(Helpers::has_permission(Auth::user()->id, 'manage_quotation|own_quotation|manage_lead'))
    <div class="card-block p-0">
      <div class="col-sm-12 px-0" id="smallDevice"> 
        @if(Helpers::has_permission(Auth::user()->id, 'manage_quotation|own_quotation'))
        <div class="col-sm-6 px-0" id="smallDevicePx">
          <div class="card">
            <div class="card-header">
              <h5>{{ __('Quotations Overview') }} <sup><span data-toggle="tooltip" title="Successful = Quotation Converted to Invoice."><i class="mdi mdi-information-variant f-18"></i></span></sup></h5>
            </div>
            <div class="card-body">
              <canvas class="float-right canvas-height-width chartPieSecond" id="chart-pie-2"></canvas>
            </div>
          </div>
        </div>
        @endif

        @if(Helpers::has_permission(Auth::user()->id, 'manage_lead'))
        <div class="col-sm-6 smallDevicePx">
          <div class="card">
            <div class="card-header">
              <h5 class="ml-4">{{ __('Leads') }}</h5>
            </div>
            <div class="card-body">
              <canvas class="float-right canvas-height-width chartPieThird" id="chart-pie-3"></canvas>
            </div>
          </div>
        </div>
        @endif
      </div>
    </div>
    @endif

    @if(Helpers::has_permission(Auth::user()->id, 'manage_expense|own_expense'))
    <div class="card-block p-0" id="ChartJsExpense">
      <div class="card mb-0">
        <div class="card-header">
          <h5>{{ __('Incomes VS Expenses') }}</h5>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered align-center w-100">
              <tr>
                <th>{{ __('Type') }}</th>
                <th>{{ __('Category') }}</th>
                <th>{{ __('Category Total') }}</th>
                <th>{{ __('Total') }}</th>
              </tr>
              <tr>
                <td class="text-center v-align-mid">{{ __('Expenses') }}</td>
                <td class="p-0">
                  <?php $expenseTotal = 0; ?>
                  <table class="table mb-0">
                    @if (!empty($categoryTotalExpenses))
                      @foreach($categoryTotalExpenses as $key => $value)
                        <tr>
                          <td class="text-center no-top-border no-right-border no-left-border">{{ $key }}</td>
                        </tr>
                        <?php $expenseTotal += $value ?>
                      @endforeach
                    @endif
                  </table>
                </td>
                <td class="p-0">
                  <table class="table mb-0">
                    @if (!empty($categoryTotalExpenses))
                      @foreach($categoryTotalExpenses as $key => $value)
                        <tr>
                          <td class="text-center no-top-border no-left-border no-right-border">{{ formatCurrencyAmount($value, $currencySymbol) }}</td>
                        </tr>
                      @endforeach
                    @endif
                  </table>
                </td>
                <td class="text-center v-align-mid">{{ formatCurrencyAmount($expenseTotal, $currencySymbol) }}</td>
              </tr>
              <tr>
                <td class="text-center v-align-mid">{{ __('Incomes') }}</td>
                <td class="p-0"> 
                  <table class="table mb-0">
                    <tr>
                      <td class="text-center no-top-border no-left-border v-align-mid">{{ __('Invoices') }}</td>
                      <td class="p-0 no-border">
                       <?php $incomeTotal = 0; ?>
                        <table class="table mb-0">
                          @if (!empty($incomeList['saleIncomeStat']))
                            @foreach($incomeList['saleIncomeStat'] as $key => $value)
                              <tr>
                                <td class="text-center no-top-border no-right-border no-left-border">{{ $key }}</td>
                              </tr>
                              <?php $incomeTotal += $value ?>
                            @endforeach
                          @endif
                        </table>
                      </td>
                    </tr>
                  </table>
                  <table class="table mb-0">
                    <tr>
                      <td class="p-0 no-border">
                        <table class="table mb-0">
                          @if(!empty($incomeList['depositStat']))
                          @foreach($incomeList['depositStat'] as $key => $value)
                            <tr>
                              <td class="text-center no-top-border no-right-border no-left-border">{{ $key }}</td>
                            </tr>
                            <?php $incomeTotal += $value ?>
                          @endforeach
                          @endif
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td class="p-0 no-right-border no-left-border no-top-border">
                  <table class="table mb-0">
                    @if (!empty($incomeList['saleIncomeStat']))
                      @foreach($incomeList['saleIncomeStat'] as $key => $value)
                        <tr>
                          <td class="text-center no-right-border no-left-border b-b-none">{{ formatCurrencyAmount($value, $currencySymbol) }}</td>
                        </tr>
                      @endforeach
                    @endif
                    @if(!empty($incomeList['depositStat']))
                    @foreach($incomeList['depositStat'] as $key => $value)
                      <tr>
                        <td class="text-center no-right-border b-b-none">{{ formatCurrencyAmount($value, $currencySymbol) }}</td>
                      </tr>
                    @endforeach
                    @endif
                  </table>
                </td>
                <td class="text-center v-align-mid">{{ formatCurrencyAmount($incomeTotal, $currencySymbol) }}</td>
              </tr>
              <tr>
                <th colspan="3" class="text-right">{{ __('Revenue') }}</th>
                <th>{{ formatCurrencyAmount(($incomeTotal - $expenseTotal), $currencySymbol) }}</th>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
    @endif
  </div>
</div>
@endsection

@section('js')
<script src="{{ asset('public/dist/plugins/DataTables-1.10.21/js/jquery.dataTablesCus.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/Responsive-2.2.5/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('public/dist/js/moment.min.js') }}"></script>
<script src="{{ asset('public/dist/plugins/bootstrap-daterangepicker/daterangepicker.min.js') }}"></script>
<script src="{{ asset('public/datta-able/plugins/select2/js/select2.full.min.js') }}"></script>
<script src="{{ asset('public/datta-able/plugins/chart-chartjs/js/Chart-2019.min.js') }}"></script>
<script type="text/javascript">
  'use strict';
    var startDate = "{!! isset($from) ? $from : 'undefined' !!}";
    var endDate   = "{!! isset($to) ? $to : 'undefined' !!}";
    var paid = {!! isset($invoiceSummery['totalPaid']) ? $invoiceSummery['totalPaid'] : 0 !!};
    var due = {!! isset($invoiceSummery['totalDue']) ? $invoiceSummery['totalDue'] : 0!!};
    var overdue = {!! isset($invoiceSummery['overDue']) ?  $invoiceSummery['overDue'] : 0 !!};
    var total = {!! $quotationStat['totalQuotation'] !!};
    var invoiced = {!! $quotationStat['quotationInvoiced'] !!};
    var labels = new Array();
    var counts = new Array();
    var colors = new Array();
    <?php  
    if (!empty($leasStat)) {
      foreach ($leasStat as $key => $value) {
        ?>
        labels.push('<?php echo sanitize_output($key.' ('.$value['count'].')'); ?>');
        counts.push('<?php echo sanitize_output($value['count']); ?>');
        colors.push('<?php echo sanitize_output($value['color']); ?>');
     <?php }
      } ?>
</script>
<script src="{{ asset('public/dist/js/custom/dashboard.min.js') }}"></script>
@endsection