<section class="content-header" id="breadcrumb_forthistemplate_hack">
    <h1>&nbsp;</h1>
    <ol class="breadcrumb" style="float:left; left:10px;">
        <li class="breadcrumb-item"><a href="index.php"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li class="breadcrumb-item"><i class="fa fa-laptop"></i> UI Elements</li>
        <li class="breadcrumb-item"><i class="fa fa-user-circle-o"></i> Role Colors</li>
    </ol>

</section>
{if $msg eq ""}
{else}
    <div class='row'>
        <div class="col-md-6">
            <div class="alert alert-warning alert-dismissable">
                <i class="fa fa-info"></i>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                {$msg}
            </div>
        </div>
    </div>
{/if}

<div class="col-md-12">

    <div class="box box-info">
        <form  action="?page=ui/roleColors" role="form" method="post" enctype="multipart/form-data">

            <div class="box-body table-responsive">

                <table id="blocktable" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Role Name</th>
                            <th>Configure</th>
                        </tr>
                    </thead>
                    <tbody>

                        {section name=rl loop=$roles}
                            <tr>
                                <td>{$roles[rl].rname}</td>
                                <td>
                                    <span class="">                                                             
                                        <a class='btn btn-info btn-flat btn-sm' href="index.php?page=ui/roleColors&action=editRoleColor&id={$roles[rl].rid}"><i style="color:#fff" class="fa fa-edit"></i> Edit CSS</a>
                                    </span>
                                </td>
                            </tr>
                        {/section}
                    </tbody>
                </table>
            </div><!-- /.box-body -->

        </form>
    </div>


</div>

