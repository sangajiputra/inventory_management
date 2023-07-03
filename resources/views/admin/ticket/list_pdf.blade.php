@extends('layouts.list_pdf')

@section('pdf-title')
<title>{{ __('Ticket Lists') }}</title>
@endsection

@section('header-info')
<td colspan="2" class="tbody-td">
    <p class="title">
      <span class="title-text"></span><strong>{{ __('Ticket Lists') }}</strong>
    </p>
    @if (isset($assigneeSelected) && !empty($assigneeSelected))
    <p class="title">
      <span class="title-text">{{ __('Assignee:') }} </span>{{ $assigneeSelected->full_name }}
    </p>
    @endif
    @if (isset($projectSelected) && !empty($projectSelected))
    <p class="title">
      <span class="title-text">{{ __('Project:') }} </span>{{ $projectSelected->name }}
    </p>
    @endif
    @if (isset($departmentSelected) && !empty($departmentSelected))
    <p class="title">
      <span class="title-text">{{ __('Department:') }} </span>{{ $departmentSelected->name }}
    </p>
    @endif
    @if (isset($statusSelected) && !empty($statusSelected))
    <p class="title">
      <span class="title-text">{{ __('Department:') }} </span>{{ $statusSelected->name }}
    </p>
    @endif
    @if (isset($date_range) && !empty($date_range))
      <p class="title">
        <span class="title-text">{{ __('Period:') }} </span> {{ $date_range }}
      </p>
    @endif
    <p class="title">
      <span class="title-text">{{ __('Print Date:') }} </span> {{ formatDate(date('d-m-Y')) }}
    </p>
</td>
@endsection

@section('list-table')
<table class="list-table">
    <thead class="list-head">
        <tr>
          <td class="text-center list-td"> {{ __('Subject') }} </td>
          <td class="text-center list-td"> {{ __('Assignee') }} </td>
          <td class="text-center list-td"> {{ __('Department') }} </td>
          <td class="text-center list-td"> {{ __('Customer') }} </td>
          <td class="text-center list-td"> {{ __('Status') }} </td>
          <td class="text-center list-td"> {{ __('Priority') }} </td>
          <td class="text-center list-td"> {{ __('Last Reply') }} </td>
          <td class="text-center list-td"> {{ __('Created at') }} </td>
        </tr>
    </thead>
    @foreach($ticketList as $data)
      <tr>
        <td class="text-center list-td"> {{ $data->subject }}
          @if ($previousUrl == 'ticket')
          <br>
          <small>{{ $data->project_name }}</small>
          @endif
        </td>
        <td class="text-center list-td"> {{ $data->assignee_name }} </td>
        <td class="text-center list-td"> {{ $data->department_name }} </td>
        <td class="text-center list-td"> {{ $data->first_name . ' ' . $data->last_name }} </td>
        <td class="text-center list-td"> {{ $data->status }} </td>
        <td class="text-center list-td"> {{ $data->priority }} </td>
        <td class="text-center list-td">
        @if($data->last_reply && $data->last_reply != $data->date)
          {{ timeZoneformatDate($data->last_reply) }}<br>{{ timeZonegetTime($data->last_reply) }}
        @else
          {{ __('Not Reply Yet') }}
        @endif
        </td>
        <td class="text-center list-td"> {{ timeZoneformatDate($data->date) }}<br>{{ timeZonegetTime($data->date) }} </td>
      </tr>
    @endforeach
</table>
@endsection
