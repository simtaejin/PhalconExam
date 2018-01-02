

<div class="page-header">
    <h1>Member list</h1>
</div>

<?php echo $this->getContent(); ?>

<div class="row">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>Email</th>

            <th>Role</th>

            <th>Created</th>
            <th>Updated</th>

            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($page->items as $user): ?>
            <tr>
                <td><?php echo $user->id ?></td>
                <td><?php echo $user->email ?></td>

                <td><?php echo $user->role ?></td>

                <td><?php echo $user->created_at ?></td>
                <td><?php echo $user->updated_at ?></td>

                <td><?php echo $this->tag->linkTo(["user/edit/" . $user->id, "Edit"]); ?></td>
                <td><?php echo $this->tag->linkTo(["user/delete/" . $user->id, "Delete"]); ?></td>
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
                <li><?php echo $this->tag->linkTo("user/search", "First") ?></li>
                <li><?php echo $this->tag->linkTo("user/search?page=" . $page->before, "Previous") ?></li>
                <li><?php echo $this->tag->linkTo("user/search?page=" . $page->next, "Next") ?></li>
                <li><?php echo $this->tag->linkTo("user/search?page=" . $page->last, "Last") ?></li>
            </ul>
        </nav>
    </div>
</div>