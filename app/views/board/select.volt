
<div class="page-header">
    <h1>
        View Board
    </h1>
</div>

<form class="form-horizontal" method="get" action="/board/{{ board_id }}/update/{{ board_idx }}">

    <div class="form-group">
        <label for="fieldTITLE" class="col-sm-2 control-label">TITLE</label>
        <div class="col-sm-10">
            {{ title }}
        </div>
    </div>


    <div class="form-group">
        <label for="fieldCONTENTS" class="col-sm-2 control-label">Contents</label>
        <div class="col-sm-10">
            {{ content }}
        </div>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">글 수정</button>

</form>