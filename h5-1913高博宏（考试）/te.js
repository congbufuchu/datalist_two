$('ul > .first').click(function () {

  $(this)
    .find('ol')
    .slideToggle(300, 'linear', () => {
      if ($(this).find('ol').css('display') === 'none') {
        $(this)
          .find('.f')
          .text('+')
      } else {

        $(this)
          .find('.f')
          .text('-')
      }
    })
    .end()
    .siblings()
    .find('ol')
    .slideUp(300, 'linear')
    .end()
    .find('.f')
    .text('+')
})

$('li>.dio').click(function () {
  $(this)
    .addClass('none')
    .parent() //父集
    .next()
    .toggleClass('none')
})

$('span>input').click(function () {
  $(this)
    .parent() //父元素
    .parent()
    .parent()
    .parent()
    .parent()
    .prev()
    .removeClass('none')
    .html($(this).parent().parent().index())
  // .html($this.css())
})

$('div').click(function () {
  $(this)
    .toggleClass('none')
})