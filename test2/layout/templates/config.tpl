<section class="content-header" id="breadcrumb_forthistemplate_hack">
    <h1>&nbsp;</h1>
    <ol class="breadcrumb" style="float:left; left:10px;">
        <li class="breadcrumb-item"><a href="index.php"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li class="breadcrumb-item active"><i class="fa fa-wrench"></i> Global Settings</li>
    </ol>

</section>
<div class="col-md-6">
    <div  class="box box-info">
        <form class="box-body" action="?page=config" role="form" method="post" enctype="multipart/form-data">
            <!--
                Site URL: 
            <input type="text" class="form-control" name="site_url" value="{"site_url"|get_opt}" /><br/>
            -->

            <label>Site Title</label>
            <input type="text" class="form-control" name="site_title" value="{"site_title"|get_opt}" /><br/>

            <label>Site Description</label>
            <input type="text" class="form-control" name="site_description" value="{"site_description"|get_opt}" /><br/>

            <label>Admin Email</label>
            <input type="text" class="form-control" name="admin_email" value="{"admin_email"|get_opt}" /><br/>
            <!--
            Captcha Public Key:
            <input type="text" class="form-control" name="captcha_public_key" value="{"captcha_public_key"|get_opt}" /><br/>
            
            Captcha Private Key:
            <input type="text" class="form-control" name="captcha_private_key" value="{"captcha_private_key"|get_opt}" /><br/>
            -->
            <label>Password Min Length</label>
            <input type="text" class="form-control" name="register_pass_min" value="{"register_pass_min"|get_opt}" /><br/>

            <label>Num of posts(All topics Page)</label>
            <input type="text" class="form-control" name="num_posts_all_topics" value="{"num_posts_all_topics"|get_opt}" /><br/>

            <label>Num of posts(while viewing a category)</label>
            <input type="text" class="form-control" name="num_posts_cat_topics" value="{"num_posts_cat_topics"|get_opt}" /><br/>

            <label>Num of posts(While viewing a topic)</label>
            <input type="text" class="form-control" name="num_posts_per_topic" value="{"num_posts_per_topic"|get_opt}" /><br/>

            <label>Forum attachment path</label>
            <input type="text" class="form-control" name="forum_attachments_path" value="{"forum_attachments_path"|get_opt}" /><br/>

            <label>Allowed Upload types(comma separated)</label>
            <input type="text" class="form-control" name="forum_attachments_exts" value="{"forum_attachments_exts"|get_opt}" /><br/>

            <label>Max Upload size(MB)</label>
            <input type="text" class="form-control" name="forum_attachments_size" value="{"forum_attachments_size"|get_opt}" /><br/>

            <label>Allowed Mimetypes</label>
            <input type="text" class="form-control" name="forum_attachments_mimetypes" value="{"forum_attachments_mimetypes"|get_opt}" /><br/>

            
            <label>Max no. of tags allowed</label>
            <input type="text" class="form-control" name="forum_tags_num" value="{"forum_tags_num"|get_opt}" /><br/>


            <label>Max characters per tag </label>
            <input type="text" class="form-control" name="forum_tags_len" value="{"forum_tags_len"|get_opt}" /><br/>

            <label>Min characters for a post</label>
            <input type="text" class="form-control" name="reply_min_chars" value="{"reply_min_chars"|get_opt}"/><br/>

            <label>Should posts in excerpts load videos ?(First video will be loaded in All topics and category
                page)</label>
            <select name="insert_oembed_videos" class="form-control">
                <option {if {"insert_oembed_videos"|get_opt} eq "yes"} selected="selected" {/if} value="yes">Yes
                </option>
                <option {if {"insert_oembed_videos"|get_opt} eq "no"} selected="selected" {/if} value="no">No</option>
            </select><br/>

            <label>
                Who can access the forum (categories/topics/posts) ?
            </label>
            <br/>
            <select name="forum_privacy" class="form-control">
                <option {if {$can_view_forum} eq "everyone"} selected="selected" {/if} value="everyone">Everyone</option>
                <option {if {$can_view_forum} eq "users"} selected="selected" {/if} value="users">Registered users</option>
                <option {if {$can_view_forum} eq "verified_users"} selected="selected" {/if} value="verified_users">Registered and Verified(either via email or via admin approval if enabled) users</option>
            </select><br/>

            <!--
            <input type="text" class="form-control" name="forum_attachments_multiple" value="{"forum_attachments_mimetypes"|get_opt}" /><br/>
            
            <input type="text" class="form-control" name="forum_attachments_parallel" value="{"forum_attachments_mimetypes"|get_opt}" /><br/>
            <input type="text" class="form-control" name="forum_attachments_max" value="{"forum_attachments_mimetypes"|get_opt}" /><br/>
            -->

            <label>
                Account registrations require admin approval ?
            </label>
            <br/>
            <input id='reg_req'
                   class="simple form-control" name="reg_req_admin"
                    {if {"reg_req_admin"|get_opt} eq "yes"} checked="checked" {/if}
                   type="checkbox"  data-toggle="toggle"
                   data-size="small"
                   data-on="yes" data-off="no"
                   data-onstyle="success" data-offstyle="default">
            <br/><br/>

            <label>
                What to show in site header menu ?
            </label>
            <br/>
            <select name="forum_header_menu" class="form-control">
                <option {if {"forum_header_menu"|get_opt} eq "site_title"} selected="selected" {/if} value="site_title">Site title defined above</option>
                <option {if {"forum_header_menu"|get_opt} eq "site_logo"} selected="selected" {/if} value="site_logo">Custom logo uploaded below</option>
            </select><br/>


            <label>Upload logo for your forum</label>
            <br>
            {"forum_logo"|get_opt}
            <input type="file" class="form-control" name="forum_logo" /><br/>


            <label>
                Allow login by
            </label>
            <br/>
            <select name="login_by" class="form-control">
                <option {if {"login_by"|get_opt} eq "USERNAME"} selected="selected" {/if} value="USERNAME">Username</option>
                <option {if {"login_by"|get_opt} eq "EMAIL"} selected="selected" {/if} value="EMAIL">Email Id</option>
                <option {if {"login_by"|get_opt} eq "USERNAME_OR_EMAIL"} selected="selected" {/if} value="USERNAME_OR_EMAIL">Both username and email id</option>
            </select><br/>

            <!--
            Captcha:
            <input type="text" class="form-control" name="captcha" value="{"captcha"|get_opt}" /><br/>
            -->
            <input type="hidden" name="CSRF_token" value="{$token}" />
            <input type="submit" value="Save" class="btn btn-primary"/>
        </form>
        <br/>
        <br/>
    </div>
</div>