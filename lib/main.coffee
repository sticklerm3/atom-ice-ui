themeName = 'atom-ice-ui'
$ = jQuery = require 'jquery'
root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe "#{themeName}.editorTitle", (value) ->
      renameProject(value)
    atom.config.observe "#{themeName}.treeViewBackground", (value) ->
      updateTreeView(value)

  deactivate: ->
    unsetProjectName()

renameProject = (editorTitle) ->
  if editorTitle == "Heartbeat"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class="pulse"></div>"""
  else if editorTitle == "PulseCircles"
    $('.tab.active[data-type="TreeView"] > .title').html """<div class="circle one"></div>
              <div class="circle two"></div>
              <div class="circle three"></div>"""
  else if editorTitle == "Classic"
    $('.tab.active[data-type="TreeView"] > .title').text("Project")

updateTreeView = (background) ->
  clearTreeViewBackground()
  if background == "Brick"
    $('.tree-view').addClass('brick')

  else if background == "Honeycomb-small"
    $('.tree-view').addClass('honeycomb-small')

  else if background == "Brick-weave"
    $('.tree-view').addClass('brick-weave')

  else if background == "Honeycomb"
    $('.tree-view').addClass('honeycomb')

  else if background == "Checkers"
    $('.tree-view').addClass('checkers')

  else if background == "Weave"
    $('.tree-view').addClass('weave')

  else if background == "Table-cloth"
    $('.tree-view').addClass('table-cloth')

  else if background == "Blueprint"
    $('.tree-view').addClass('blueprint')

  else if background == "Classic"
    $('tree-view').addClass('bb-black')

clearTreeViewBackground = ->
  $('.tree-view').removeClass('brick')
  $('.tree-view').removeClass('honeycomb')
  $('.tree-view').removeClass('bb-black')
  $('.tree-view').removeClass('honeycomb-small')
  $('.tree-view').removeClass('brick-weave')
  $('.tree-view').removeClass('checkers')
  $('.tree-view').removeClass('weave')
  $('.tree-view').removeClass('table-cloth')
  $('.tree-view').removeClass('blueprint')



unsetProjectName = ->
  $('.tab.active[data-type="TreeView"] > .title').text('Projectx')
