<section class="content-header" id="breadcrumb_forthistemplate_hack">
    <h1>&nbsp;</h1>
    <ol class="breadcrumb" style="float:left; left:10px;">
        <li class="breadcrumb-item"><a href="index.php"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li class="breadcrumb-item"><i class="fa fa-laptop"></i> UI Elements</li>
        <li class="breadcrumb-item"><i class="fa fa-edit"></i> Edit Role CSS</li>
    </ol>

</section>
{if $msg eq ""}
{else}
    <div class='row'>
        <div class="col-md-6">
            <div class="alert alert-info alert-dismissable">
                <i class="fa fa-info"></i>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                {$msg}
            </div>
        </div>
    </div>
{/if}
<div class="col-md-12">

    <div class="box box-info">
        <form  action="?page=ui/roleColors&action=save" role="form" method="post" enctype="multipart/form-data">
            <input type="hidden" value="{$role.rid}" name="roleId"/>

            <div class="box-body table-responsive">

                <div class="form-group">
                    <label>Role Name:</label>

                    {$role.rname|default:''}
                </div>

                <div class="form-group"  id="block_html" >
                    <textarea rows="3" id="block_html_tarea" name="role_css" placeholder="<!-- HTML CODE -->" class="form-control" >{$role.color|default:$role.defaultColor|escape:'html'}</textarea>


                    <div id="editor" style=" position: relative;height: 300px;">{$role.color|default:$role.defaultColor|escape:'html'}</div>

                </div>

                <div class="form-group">

                    <input type="hidden" name="CSRF_token" value="{$token}" />
                    <input type="submit" value="Save" class="btn btn-success" />
                    <a href="index.php?page=ui/roleColors" class="btn btn-default">Back</a>

                </div>
            </div><!-- /.box-body -->

        </form>
    </div>


</div>

<script src="//cdn.jsdelivr.net/ace/1.1.7/min/ace.js" type="text/javascript" charset="utf-8"></script>
<script>

    try {
        var editor = ace.edit("editor");
        editor.setTheme("ace/theme/chrome");
        editor.getSession().setMode("ace/mode/css");

        $('#block_html_tarea').hide();
        editor.getSession().on('change', function () {
            $('#block_html_tarea').val(editor.getSession().getValue());
        });

    }
    catch (e) {

        $('#editor').hide();
        $('#block_html_tarea').show();

    }
</script>

