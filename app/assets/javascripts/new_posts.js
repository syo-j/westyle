$(function() {
  var member_num = $('.js-team_member').length;
  $('#add_item_button').on('click', function() {
    var input =
        '<div class="js-team_member" id="add_member_' + member_num + '">'
        + '<input class="form-control" placeholder="メンバーの名前を入力して下さい" type="text" name="team[members_attributes][' + member_num + '][name]" id="team_members_attributes_' + member_num + '_name" required>'
        + '<input class="form-control" placeholder="メンバーの年齢を入力して下さい" type="text" name="team[members_attributes][' + member_num + '][grade]" id="team_members_attributes_' + member_num + '_grade" required>'
        + '<span class="member_delete" data-id="' + member_num + '">'
        +   'Delete'
        + '</span>'
        +'</div>'
    $('#team_members_box').append(input);
    member_num ++;
  });

  $('#team_members_box').on('click', '.member_delete', function() {
    var inputId = $(this).data('id');
    var defaultData = $(this).data('default');
    if (defaultData == 'default') {
      $(this).prev().prop('checked', true);
      $('#add_member_' + inputId).hide();
    }else{
      $('#add_member_' + inputId).remove();
    }
  });
});