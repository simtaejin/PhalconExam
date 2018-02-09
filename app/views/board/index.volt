
<div class="page-header">
    <h1>{{ board_id }} list</h1>
    <p>
        <?php echo $this->tag->linkTo(["board/".$board_id."/new/", "추가"]); ?>
    </p>
</div>

<div class="row">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>No</th>
            <th>Title</th>
            <th>Member</th>
            <th>Created</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($page->items as $board): ?>
            <tr>
                <td></td>
                <td><?php echo $board->title ?></td>
                <td><?php echo $board->member ?></td>
                <td><?php echo $board->created ?></td>
                <td><?php echo $this->tag->linkTo(["board/".$board_id."/edit/".$board->idx, "수정"]); ?></td>
                <td><?php echo $this->tag->linkTo(["board/".$board_id."/delete/". $board->idx, "삭제"]); ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>

<div class="row">
    <div class="col-sm-1">
        <p class="pagination" style="line-height: 1.42857;padding: 6px 12px;">
            <?php echo $page->current, "/", $page->total_pages ?>
        </p>
    </div>
    <div class="col-sm-11">
        <nav>
            <ul class="pagination">
                <li><?php echo $this->tag->linkTo("board/".$board_id."/" ,"First") ?></li>
                <li><?php echo $this->tag->linkTo("board/".$board_id."/".$page->before, "Previous") ?></li>
                <li><?php echo $this->tag->linkTo("board/".$board_id."/".$page->next, "Next") ?></li>
                <li><?php echo $this->tag->linkTo("board/".$board_id."/".$page->last, "Last") ?></li>
            </ul>
        </nav>
    </div>
</div>