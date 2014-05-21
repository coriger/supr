// 删除文章
function deleteBlog(blogId){
		$.ajax({
				url : "./blog/delete/" + blogId,
				method : "post",
				contentType : "application/json",
				dataType : "json",
				success : function(data) {
					if (data.resultCode == 'error') {
						// 这里可以考虑记住标签id 然后自动选择出错字段
						alert(data.errorInfo);
					} else if (data.resultCode == 'success') {
						$("#"+blogId).remove();
					}
				}
		})
}

// 编辑文章
function editBlog(blogId){
	$("#form").attr("action","./blog/edit/" + blogId);
	$("#form").submit();
}