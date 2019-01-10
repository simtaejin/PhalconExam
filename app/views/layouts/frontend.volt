    <div class="container">
      <!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
      <div class="masthead">
        <h3 class="text-muted">Project name</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="active"><a href="#">Home</a></li>
            {% for bbds in bbd %}
            <li><a href="/board/{{ bbds.id }}/">{{ bbds.name }}</a></li>
            {% endfor %}
          </ul>
        </nav>
      </div>
     {{ content() }}
     <!--
      <div class="row">
        <div class="col-lg-4">
          <h2><?php echo mb_substr($tbd->title,0,15); ?></h2>
          <p><?php echo mb_substr($tbd->content,0,175); ?></p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>
    -->
      <!--
        <div class="col-lg-4">
          <img class="featurette-image img-responsive" data-src="holder.js/140x140/auto" alt="Generic placeholder image">
          <p>&nbsp;</p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </div>
       -->
      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; 2016 Company, Inc.</p>
      </footer>

    </div> <!-- /container -->