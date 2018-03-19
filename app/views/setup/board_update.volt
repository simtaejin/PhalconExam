
<div class="page-header">
    <h1>
        Update
    </h1>
</div>

<form class="form-horizontal" method="post" action="{{ url('setup/board/update') }}/{{ idx }}">
    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
    <input type="hidden" name="idx" value="{{ idx }}">

    <div class="form-group">
        <label for="fieldID" class="col-sm-2 control-label">ID</label>
        <div class="col-sm-10">
           {{ id }}
        </div>
    </div>


    <div class="form-group">
        <label for="fieldNAME" class="col-sm-2 control-label">NAME</label>
        <div class="col-sm-10">
            <input type="text" name="name" id="fieldNAME" class="form-control" value="{{ name }}" autofocus>
        </div>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">글 쓰기</button>

</form>