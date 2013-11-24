<%inherit file="/forums/base/base.mako"/>

<%block name="title">${photo_album.name}</%block>
<%block name="where_am_i">
<li><a href="${request.route_path('photos.photo_albums.index')}">Photo Albums</a></li>
<li><a href="${request.route_path('photos.photo_albums.view', photo_album_id=photo_album.id)}">${photo_album.name}</a></li>
</%block>
<%block name="panel_title">${photo_album.name}</%block>

<ul class="pager">
  <li class="previous${' disabled' if pprevious is None else ''}">
  	% if pprevious is not None:
  	<a href="${request.route_path('photos.photo_albums.photo_view', photo_album_id=photo_album.id, photo_id=pprevious.id)}">&larr; Previous</a>
  	% else:
  	<a href="#">&larr; Previous</a>
  	% endif
  </li>
  <li class="next${' disabled' if pnext is None else ''}">
  	% if pnext is not None:
  	<a href="${request.route_path('photos.photo_albums.photo_view', photo_album_id=photo_album.id, photo_id=pnext.id)}">Next &rarr;</a>
  	% else:
  	<a href="#">Next &rarr;</a>
  	% endif
  </li>
</ul>

<img class="img-rounded" alt="${photo.caption}" src="${request.route_path('photos.view', photo_album_id=photo_album.id, photo_id=photo.image.filename)}" />
<div class="well well-sm">
	<p><b>License:</b> ${photo.license}</p>
	% if photo.caption:
	<p>${photo.caption}</p>
	% endif
</div>

<%block name="more_body">
<%include file="/base/comments.mako", args="item=photo"/>
</%block>