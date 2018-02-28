
<div class="page-header">
    <h1>
        Create Board
    </h1>
</div>

<form class="form-horizontal" method="post" action="/board/{{ board_id }}/create/">
    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
    <input type="hidden" name="board_id" value="{{ board_id }}">

    <div class="form-group">
        <label for="fieldTITLE" class="col-sm-2 control-label">TITLE</label>
        <div class="col-sm-10">
            <input type="text" name="title" id="fieldTITLE" class="form-control"  autofocus>
        </div>
    </div>


    <div class="form-group">
        <label for="fieldCONTENTS" class="col-sm-2 control-label">Contents</label>
        <div class="col-sm-10">
            <textarea name="content" id="fieldCONTENTS" class="form-control" rows="13"  >

            </textarea>
        </div>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">글 쓰기</button>

</form>


