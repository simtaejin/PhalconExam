<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="<?= $this->url->get('/index') ?>">Home</a></li>
                <li><a href="<?= $this->url->get('member/') ?>">회원</a></li>
                <li><a href="<?= $this->url->get('board/board') ?>">게시판</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                {% if !userId  %}
                <li><a href="<?= $this->url->get('loginout/login') ?>">로그인</a></li>
                <li><a href="<?= $this->url->get('member/new') ?>">회원가입</a></li>
                {% else %}
                <li><a href="<?= $this->url->get('loginout/dologout') ?>">로그아웃</a></li>
                <li><a href="<?= $this->url->get('member/edit/') ?>{{ userId }}">정보수정</a></li>
                {% endif %}

            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">

    {{ content() }}

</div> <!-- /container -->

<footer class="footer">
    <div class="container">
        <p class="text-muted">Place sticky footer content here.</p>
    </div>
</footer>
