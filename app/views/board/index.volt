
<div class="page-header">
    <h1>Board list</h1>
    <p>
        <?php echo $this->tag->linkTo(["board/new/", "추가"]); ?>
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
        <?php foreach ($page->items as $baord): ?>
            <tr>
                <td></td>
                <td><?php echo $baord->title ?></td>
                <td><?php echo $baord->member ?></td>
                <td><?php echo $baord->created ?></td>
                <td><?php echo $this->tag->linkTo(["board/edit/" . $baord->idx, "수정"]); ?></td>
                <td><?php echo $this->tag->linkTo(["board/delete/" . $baord->idx, "삭제"]); ?></td>
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
                <li><?php echo $this->tag->linkTo("board/", "First") ?></li>
                <li><?php echo $this->tag->linkTo("board/?page=" . $page->before, "Previous") ?></li>
                <li><?php echo $this->tag->linkTo("board/?page=" . $page->next, "Next") ?></li>
                <li><?php echo $this->tag->linkTo("board/?page=" . $page->last, "Last") ?></li>
            </ul>
        </nav>
    </div>
</div>