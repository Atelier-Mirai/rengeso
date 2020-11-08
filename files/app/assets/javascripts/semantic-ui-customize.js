//初回読み込み、リロード、ページ切り替えでドロップダウンメニューを使えるようにする
$(document).on('turbolinks:load', function() {
  // show dropdown on hover
  $('.ui.dropdown').dropdown({
    on: 'hover'
  });

  // flashをxボタンで消せる
  $('.message .close').on('click', function() {
    $(this).closest('.message')
           .transition('fade');
  });

  // sidebar
  $('#js-sidebar').on('click', function() {
    $('.ui.sidebar').sidebar('toggle')
    $('body.pushable').css({ 'background': 'transparent' })
  })

  // モーダルウィンドウ
  $('.show_about').on('click', function() {
    $('.ui.modal').modal('show');
  });

  // タブ
  $('.ui.tabular.menu .item').tab();

  // カレンダー
  $('#datetime_calendar').calendar({
    type: 'datetime',
    ampm: false,
    formatter: {
      date: function (date, settings) {
        if (!date) return '';
        var year  = date.getFullYear();
        var month = date.getMonth() + 1;
        if (month < 10) month = '0' + month
        var day   = date.getDate();
        if (day < 10) day = '0' + day
        return year + '-' + month + '-' + day;
      }
    },
    text: {
      days: ['日', '月', '火', '水', '木', '金', '土'],
      months: ['睦月', '如月', '弥生', '卯月', '皐月', '水無月', '文月', '葉月', '長月', '神無月', '霜月', '師走'],
      monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      today: '本日',
      now: '只今',
      am: '午前',
      pm: '午後'
    }
  })

  $('#date_calendar').calendar({
    type: 'date',
    ampm: false,
    formatter: {
      date: function (date, settings) {
        if (!date) return '';
        var year  = date.getFullYear();
        var month = date.getMonth() + 1;
        if (month < 10) month = '0' + month
        var day   = date.getDate();
        if (day < 10) day = '0' + day
        return year + '-' + month + '-' + day;
      }
    },
    text: {
      days: ['日', '月', '火', '水', '木', '金', '土'],
      months: ['睦月', '如月', '弥生', '卯月', '皐月', '水無月', '文月', '葉月', '長月', '神無月', '霜月', '師走'],
      monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      today: '本日'
    }
  })

  $('#time_calendar').calendar({
    type: 'time',
    ampm: false,
    // text: {
    //   now: '只今',
    //   am: '午前',
    //   pm: '午後'
    // }
  })
})
