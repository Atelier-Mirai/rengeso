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
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
