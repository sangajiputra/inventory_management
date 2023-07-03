<!DOCTYPE html>
<head>
    <title>{{ $company_name }} | {{ isset($page_title) ? $page_title : __('Inventory Management') }}</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
        <script src="{{ asset('public/dist/js/respond.min.js') }}"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    @include('layouts.includes.meta')
    <!-- Favicon icon -->
    @if(!empty($favicon))
        <link rel='shortcut icon' href="{{ URL::to('/') }}/public/uploads/companyIcon/{{ $favicon }}" type='image/x-icon' />
    @endif
    <!-- fontawesome icon -->
    <link rel="stylesheet" href="{{ asset('public/datta-able/fonts/fontawesome/css/fontawesome-all.min.css') }}">
    <!-- Material icon -->
    <link rel="stylesheet" href="{{ asset('public/datta-able/fonts/material/css/materialdesignicons.min.css') }}">
    <!-- flaq icon -->
    <link rel="stylesheet" href="{{ asset('public/datta-able/fonts/flag/css/flag-icon.min.css') }}">
    <!-- animation css -->
    <link rel="stylesheet" href="{{ asset('public/datta-able/plugins/animation/css/animate.min.css') }}">
    <!-- vendor css -->
    <link rel="stylesheet" href="{{ asset('public/datta-able/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('public/dist/css/custom.min.css') }}">


    <!--Custom CSS that was written on view-->
    @yield('css')

    @php
        if (getThemeClass('theme-mode') == 'navbar-dark brand-dark') {
    @endphp
        <link rel="stylesheet" href="{{ asset('public/datta-able/css/layouts/dark.min.css') }}">
        <link rel="stylesheet" href="{{ asset('public/datta-able/css/layouts/dark-custom.min.css') }}">
    @php } @endphp

    <!-- Theme style RTL -->
    @php
      if (\Cache::get('gb-language-direction') == 'rtl') {
    @endphp
        <link rel="stylesheet" href="{{ asset('public/datta-able/css/layouts/rtl.css') }}">
    @php } @endphp

    <script type="text/javascript">
        'use strict';
        var SITE_URL              = "{{ URL::to('/') }}";
        var currencySymbol        = '{!! $default_currency->symbol !!}';
        var defaultCurrencySymbol = '{!! $default_currency->symbol !!}';
        var decimal_digits        = "{{ $decimal_digits }}";
        var thousand_separator    = "{{ $thousand_separator }}";
        var symbol_position       = "{!! $symbol_position !!}";
        var dateFormat            = '{!! $date_format_type !!}';
        var token                 = '{!! csrf_token() !!}';
        var app_locale_url        = "{!! url('/resources/lang/' . config('app.locale') . '.json') !!}";
        var row_per_page          = '{!! $row_per_page !!}';
        var txLnSts               = {!! $json !!};
        var language_direction    = '{!! \Cache::get('gb-language-direction') !!}';
    </script>

    <!-- Required Js -->
    <script src="{{ asset('public/datta-able/js/vendor-all.js') }}"></script>
</head>

<?php
	$appName = env('APP_NAME', '');
	$appName = (!empty($appName) && mb_strlen($appName) > 19) ? mb_substr($appName, 0, 17) .'..' : $appName;
?>

<body class="{{ getThemeClass('body') }} m-5">
    <!-- [ Pre-loader ] start -->
    <div class="loader-bg">
        <div class="loader-track">
            <div class="loader-fill"></div>
        </div>
    </div>
    <!-- [ Pre-loader ] End -->

    <!-- [ navigation menu ] start -->
    <!-- [ navigation menu ] end -->

    <!-- [ Header ] start -->
    @include('layouts.includes.external_header')
    <!-- [ Header ] end -->

    <!-- [ Main Content ] start -->
    <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
            <div class="pcoded-content">
                <div class="pcoded-inner-content">
                    <!-- [ breadcrumb ] start -->
                    @include('layouts.includes.notifications')

                    <!-- [ breadcrumb ] end -->
                    <div class="main-body">
                        <div class="page-wrapper">
                            <!-- [ Main Content ] start -->
                            <div class="row">
                                @yield('content')
                            </div>
                            <!-- [ Main Content ] end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('layouts.includes.footer')
    <!-- [ Main Content ] end -->

    <!-- Warning Section start -->
    <!-- Older IE warning message -->
    <!--[if lt IE 11]>
        <div class="ie-warning">
            <h1>Warning!!</h1>
            <p>You are using an outdated version of Internet Explorer, please upgrade
               <br/>to any of the following web browsers to access this website.
            </p>
            <div class="iew-container">
                <ul class="iew-download">
                    <li>
                        <a href="//www.google.com/chrome/">
                            <img src="{{ asset('public/datta-able/images/browser/chrome.png') }}" alt="Chrome">
                            <div>Chrome</div>
                        </a>
                    </li>
                    <li>
                        <a href="//www.mozilla.org/en-US/firefox/new/">
                            <img src="{{ asset('public/datta-able/images/browser/firefox.png') }}" alt="Firefox">
                            <div>Firefox</div>
                        </a>
                    </li>
                    <li>
                        <a href="//www.opera.com">
                            <img src="{{ asset('public/datta-able/images/browser/opera.png') }}" alt="Opera">
                            <div>Opera</div>
                        </a>
                    </li>
                    <li>
                        <a href="//www.apple.com/safari/">
                            <img src="{{ asset('public/datta-able/images/browser/safari.png') }}" alt="Safari">
                            <div>Safari</div>
                        </a>
                    </li>
                    <li>
                        <a href="//windows.microsoft.com/en-us/internet-explorer/download-ie">
                            <img src="{{ asset('public/datta-able/images/browser/ie.png') }}" alt="">
                            <div>IE (11 & above)</div>
                        </a>
                    </li>
                </ul>
            </div>
            <p>Sorry for the inconvenience!</p>
        </div>
    <![endif]-->
    <!-- Warning Section Ends -->
    {{-- Custom Js --}}
    <script>
        "use strict";
        var menu = "{{ $menu }}";
    </script>
    <!-- Required Js -->
    <script src="{{ asset('public/datta-able/js/pcoded.min.js') }}"></script>
    <script src="{{ asset('public/dist/js/custom/app-layout.min.js') }}"></script>
    <!-- Custom Js -->
    @yield('js')
</body>

</html>
