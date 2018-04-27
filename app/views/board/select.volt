
<div class="page-header">
    <h1>
        View Board
    </h1>
</div>

<form name="frm" class="form-horizontal" method="get" action="/board/{{ board_id }}/update/{{ board_idx }}">

    <div class="form-group">
        <label for="fieldTITLE" class="col-sm-2 control-label">TITLE</label>
        <div class="col-sm-10">
            {{ title }}
        </div>
    </div>


    <div class="form-group">
        <label for="fieldCONTENTS" class="col-sm-2 control-label">Contents</label>
        <div class="col-sm-10">
            {{ content|nl2br }}
        </div>
    </div>

    <div class="form-group">
        <label for="fieldCONTENTS" class="col-sm-2 control-label">Files</label>
        <div class="col-sm-10">
            <?php if ($files[$board_idx]): ?>
                <?php foreach ($files[$board_idx] as $k => $v): ?>
                    <?php echo $v['artifical_name']."<br>" ?>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">글 수정</button>
    <button class="btn btn-lg btn-primary btn-block" type="button" name="btn_reply" id="btn_reply">글 답글</button>
</form>


<div class="row">


    <form name="frm" class="form-horizontal" method="get" action="/board/{{ board_id }}/update/{{ board_idx }}">

        <div class="form-group">
            <label for="fieldCONTENTS" class="col-sm-2 control-label">Contents</label>
            <div class="col-sm-10">
                <textarea name="content" id="fieldCONTENTS" class="form-control" rows="3"  ></textarea>
            </div>
        </div>
        <div class="navbar-right">
            추가
        </div>
    </form>



    <table class="table table-bordered">
        <thead>
        <tr>
            <th>No</th>
            <th>memo</th>
            <th>Member</th>
        </tr>
        </thead>
        <tbody>
        <?php if ($comments[$board_idx]): ?>
            <?php foreach ($comments[$board_idx] as $k => $v): ?>
            <tr>
                <td></td>
                <td><?php echo nl2br($v['memo'])?></td>
                <td></td>
            </tr>
            <?php endforeach; ?>
        <?php endif;?>

        </tbody>
    </table>
</div>


<!--
<?php if ($comments[$board_idx]): ?>
    <?php foreach ($comments[$board_idx] as $k => $v): ?>
        <?php echo nl2br($v['memo'])."<br>" ?>
    <?php endforeach; ?>
<?php endif;?>
-->
<script>
    $(function() {
        $('#btn_reply').click(function(){
            $("[name='frm']").attr('action','/board/{{ board_id }}/replycreate/{{ board_idx }}');
            $("[name='frm']").submit();
        });
    });
</script>