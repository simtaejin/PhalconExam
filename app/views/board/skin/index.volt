
<div class="page-header">
    <h1><?php echo $board_setup_data['name']?> list</h1>
    <p>
        <?php echo $this->tag->linkTo(["board/".$board_id."/create/", "추가"]); ?>
    </p>
</div>
<?php $page_num = $page->total_items + ($page->limit * (1-$page->current));?>
<div class="row">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>No</th>
            <th>Title</th>
            <th>Member</th>
	        <th>Files</th>
            <th>Created</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($page->items as $v => $board) { ?>
            <tr>
                <td><?php echo $page_num - $v?></td>
                <td>
                    <?php echo $this->tag->linkTo(["board/".$board_id."/select/".$board->idx, $board->title]);?>
                    <?php
                        if (isset($comments[$board->idx][0])) {
                            echo "(".count($comments[$board->idx]).")";
                        }
                    ?>
                </td>
                <td><?php echo $board->member ?></td>
                <td>
                    <?php
                    if (isset($files[$board->idx][0])) {
                        echo count($files[$board->idx]);
                    }
                    ?>
                </td>
                <td><?php echo $this->component->helper->dateformate("Y.m.d H.i.s", $board->created )?></td>
                <td><?php echo $this->tag->linkTo(["board/".$board_id."/update/".$board->idx, "수정"]); ?></td>
                <td><?php echo $this->tag->linkTo(["board/".$board_id."/delete/". $board->idx, "삭제"]); ?></td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>

<div class="row">
    <div class="col-sm-1" >
        <p class="pagination" style="line-height: 1.42857;padding: 6px 12px;">
            <?php echo $page->current, "/", $page->total_pages ?>
        </p>
    </div>
    <div class="col-sm-7">
        <nav>
            <ul class="pagination">
                <li><?php echo $this->tag->linkTo("board/".$board_id."/" ,"First") ?></li>
                <li><?php echo $this->tag->linkTo("board/".$board_id."/".$page->before, "Previous") ?></li>
                <li><?php echo $this->tag->linkTo("board/".$board_id."/".$page->next, "Next") ?></li>
                <li><?php echo $this->tag->linkTo("board/".$board_id."/".$page->last, "Last") ?></li>
            </ul>
        </nav>
    </div>
    <div class="col-sm-4">
        <form method="get" class="navbar-form navbar-right">
            <select name="search_category" class="form-control">
                <option value="title" <?php if ($search_category == "title") { echo "selected"; } ?> >제목</option>
                <option value="member" <?php if ($search_category == "member") { echo "selected"; } ?> >member</option>
                <option value="content" <?php if ($search_category == "content") { echo "selected"; } ?> >내용</option>
            </select>
            <input type="text" name="search_text" class="form-control" value="<?php echo $search_text?>">
            <button class="btn btn-block" type="submit">찾기</button>
        </fomr>
    </div>
</div>