
<div class="page-header">
    <h1>
        Update Member
    </h1>
</div>

<form class="form-horizontal" method="post" action="{{ url('member/edit') }}/{{ id }}">
    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
    <?php echo $this->tag->hiddenField("id") ?>

    <div class="form-group">
        <label for="fieldID" class="col-sm-2 control-label">ID</label>
        <div class="col-sm-10">
            {{ id }}
        </div>
    </div>



    <div class="form-group">
        <label for="fieldEmail" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            {{ email }}
        </div>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">회원 수정</button>

</form>


