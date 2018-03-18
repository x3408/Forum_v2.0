KindEditor.ready(function(K) {
        var editor1 = K.create('textarea[name="content"]', {
            cssPath : 'kindeditor/plugins/code/prettify.css',
            uploadJson : 'KindEditorAction_uploadImg',
            fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
            allowFileManager : true,
            items : ['source','fontname','fontsize','forecolor','preview','selectall','justifyleft','justifycenter','justifyright','emoticons','link','unlink','image'],
            resizeType:0,
            urlType: 'domain',
            afterCreate: function () {  //要取值设置这里 这个函数就是同步KindEditor的值到textarea文本框
                this.sync();
            },
            afterBlur: function () {  //同时设置这里
                this.sync();
            }
        });
        k('input[name=content]').click(function(e){
            editor.sync();
        });
    });
function loadSelect() {
     //使用jquery的ajax方法访问后台
     $.post(
         "${pageContext.request.contextPath}/TopicAction_findTopicTypeList",
         function (data) {
             $.each(
                 data,
                 function(i,json) {
                     var $option = $("<option value='"+json['type']+"'>"+json['typeName']+"</option>");
                     $('#selectId').append($option);
                 }
             )
         },
         "json"
     );
 };
window.onload=function(){
	loadSelect();
}
