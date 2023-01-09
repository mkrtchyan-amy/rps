$(function() {
  $(document).on('click', '.game-modal .close-icon, .game-modal .confirm button', function () {
    $(this).closest('.game-modal').hide();
  });

  $('.options .option').not('.inactive').on('click', function () {
    const modal = $('.loading-modal');
    const chosenOption = modal.find('.option.chosen-option');
    chosenOption.find('img').attr('src', $(this).find('img').attr('src'));
    chosenOption.find('.option-name').text($(this).find('.option-name').text());
    modal.show();

    $.ajax({
      url: '/play',
      data: {
        authenticity_token: $('[name="csrf-token"]')[0].content,
        move: $(this).data('id'),
      },
      method: 'POST',
      success: function(result) {
        modal.hide();
        const resultModal = $('.game-modal.result-modal');
        resultModal.find('.modal-content').html(result);
        resultModal.show();
      }
    });
  });
})
