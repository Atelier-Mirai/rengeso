// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

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

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
