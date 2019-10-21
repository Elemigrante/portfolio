ready = ->
  typed = new Typed('.element'
    strings: [
      'The industry is rapidly developing and constantly moving forward.' +
        ' &nbsp; This is something that requires constant training throughout our career.' +
        ' &nbsp; This is interesting for me as there will always be new things to learn and new challenges to overcome.'
    ]
    typeSpeed: 30
    startDelay: 20
    backDelay: 200
  )
  return

$(document).ready
$(document).on 'turbolinks:load', ready