<%inherit file="home_comp.mako"/>
<%namespace name="util" file="util.mako"/>

<%block name="head">
<style type="text/css">
.dataTables_filter {display: none;}
</style>
</%block>


<%def name="sidebar()">
    <%util:well title="Editions">
    <ul class="nav nav-pills nav-stacked">
        <li class="active">
            <a href="#e2014">2014</a>
        </li>
      <li class="active">
        <a href="#e2013">2013</a>
      </li>
      <li class="active">
        <a href="#e2011">2011</a>
      </li>
      <li class="active">
        <a href="#e2008">2008</a>
      </li>
    </ul>
    </%util:well>
</%def>

<h3>Changes</h3>
<p>
  This page lists changes between different editions of WALS Online. While no longer accessible
  online, the data of older editions could be computed using the changes listed here. If you
  need a full database of an older edition this may prove cumbersome, so in this case
  <a href="${request.route_url('contact')}">contact us</a> or download the data from
  ${h.external_link('https://github.com/clld/wals-data', label='the github repository')}.
</p>
<p>
    Changes of non-core data, e.g. language names or classification, may occur anytime.
    These changed are tracked via
    ${h.external_link('https://github.com/clld/wals-data/issues', label='issues on GitHub')}
    and applied to the database by running
    ${h.external_link('https://github.com/clld/wals3/tree/master/migrations/versions', label='migration scripts')}.
    The current version number of the database is
    <strong><span style="font-family: monospace">${db_version}</span></strong>
    (cf. the ${h.external_link('https://github.com/clld/wals3/blob/master/migrations/README', label='version history of the database')}).
</p>

<%util:section title="WALS Online 2014" id="e2014" level="${4}">
<%util:table items="${changes2014}" eid="t2014" args="item" class_="table-nonfluid">\
    <%def name="head()">
        <th> </th><th>Feature</th><th>Number of added/changed datapoints</th>
    </%def>
    <% vss = list(item[1]) %>
    <td>
      <button title="click to toggle display of datapoints"
              type="button" class="btn btn-mini expand-collapse" data-toggle="collapse" data-target="#c2014-${item[0].pk}">
        <i class="icon icon-plus"> </i>
      </button>
    </td>
    <td>
      ${h.link(request, item[0])}
        <div id="c2014-${item[0].pk}" class="collapse">
          ${util.stacked_links(vss)}
        </div>
    </td>
    <td>${str(len(vss))}</td>
</%util:table>
<p>
    Small corrections have been made to the classification mainly triggered by updates in
    Glottolog's classification.
    ## https://github.com/clld/wals-data/issues?labels=wals-2014-7
</p>
</%util:section>


<%util:section title="WALS Online 2013" id="e2013" level="${4}">

<h5>Value assignment changes</h5>
<p>
  The changes listed below include value corrections and additions of new values for existing features.
  Details about specific corrections can be found
  ${h.external_link("https://github.com/clld/wals3/issues?labels=data&milestone=1&state=closed", label='here')}.
</p>
<%util:table items="${changes2013}" eid="t2013" args="item" class_="table-nonfluid">\
    <%def name="head()">
        <th> </th><th>Feature</th><th>Number of added/changed datapoints</th>
    </%def>
    <% vss = list(item[1]) %>
    <td>
      <button title="click to toggle display of datapoints"
              type="button" class="btn btn-mini expand-collapse" data-toggle="collapse" data-target="#c2013-${item[0].pk}">
        <i class="icon icon-plus"> </i>
      </button>
    </td>
    <td>
      ${h.link(request, item[0])}
        <div id="c2013-${item[0].pk}" class="collapse">
          ${util.stacked_links(vss)}
        </div>
    </td>
    <td>${str(len(vss))}</td>
</%util:table>
<p>
  Several datapoints have been removed (typically because they had been assigned to the
  wrong language, thus they show up as additions above).
</p>
##<%util:table items="${removals2013}" eid="r2013" args="item" class_="table-nonfluid">\
##    <%def name="head()">
##        <th>Feature</th><th>Number of removed datapoints</th>
##    </%def>
##    <td><a href="${request.route_url('parameter', id=item[0])}">${item[1]}</a></td>
##    <td>${str(item[2])}</td>
##</%util:table>
</%util:section>


<%util:section title="WALS Online 2011" id="e2011" level="${4}">
<h5>Value assignment changes</h5>
<p>
  The changes listed below include value corrections and additions of new values for existing features.
</p>
<%util:table items="${changes2011}" eid="t2011" args="item" class_="table-nonfluid">\
    <%def name="head()">
        <th> </th><th>Feature</th><th>Number of added/changed datapoints</th>
    </%def>
    <% vss = list(item[1]) %>
    <td>
      <button title="click to toggle display of datapoints"
              type="button" class="btn btn-mini expand-collapse" data-toggle="collapse" data-target="#c2011-${item[0].pk}">
        <i class="icon icon-plus"> </i>
      </button>
    </td>
    <td>
      ${h.link(request, item[0])}
        <div id="c2011-${item[0].pk}" class="collapse">
          ${util.stacked_links(vss)}
        </div>
    </td>
    <td>${str(len(vss))}</td>
</%util:table>

<h5>Other changes</h5>
<ul>
  <li>
    There are two new chapters (chapter 143 on Order of Negative Morpheme and Verb, and
    chapter 144 on Position of Negative Word With Respect to Subject, Object, and Verb,
    both with many new maps)
  </li>
  <li>
    Additional features have been added to some chapters.
  </li>
  <li>
    The genealogical classification of languages, including genera, has been updated.
  </li>
  <li>
    The one-to-many relationship between chapters and features/maps is now clearly reflected
    in the structure of WALS: A single chapter can contain not just one feature, but several
    features, most often two (e.g. feature 39A and feature 39B), but sometimes (with the new
    chapters 143 and 144) quite a few features and maps.
  </li>
  <li>
    For some of the features, WALS now includes examples supplied by the authors (for example feature 113A)
  </li>
  <li>
    WALS Online now contains the long introduction chapter of the printed atlas from 2005
  </li>
</ul>
</%util:section>

<%util:section title="WALS Online 2008" id="e2008" level="${4}">
  <p>
    A description of errate in the printed version of 2005 can be found at
    ${h.external_link('http://blog.wals.info/category/errata/errata-2005/')}.
  </p>
</%util:section>

<script>
$(document).ready(function() {
    $('.expand-collapse').click(function(){ //you can give id or class name here for $('button')
        $(this).children('i').toggleClass('icon-minus icon-plus');
    });
});
</script>
