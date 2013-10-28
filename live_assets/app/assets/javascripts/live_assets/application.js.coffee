window.onload = ->
  # 1. Connect to our event-stream
  source = new EventSource('/live_assets/sse')

  source.onerror = (e) ->
    console.log "EventSource errored #{e}"

  source.onmessage = (e) ->
    console.log "Received message #{e.data}"

  # 2. This callback will be triggered on every reloadCSS event
  source.addEventListener 'reloadCSS', (e) ->
    # 3. Load all CSS entries
    sheets  = document.querySelectorAll("[rel=stylesheet]")

    # 4. For each entry, clone it, add it to the document and remove the original after
    for sheet in sheets
      clone = sheet.cloneNode()
      clone.addEventListener 'load', ->
        sheet.parentNode.removeChild(sheet)
      document.head.appendChild(clone)
