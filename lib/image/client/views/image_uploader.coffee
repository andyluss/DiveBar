Template.imageUploader.helpers
  imagesUploaded: -> imagesUploaded(@creator)

Template.imageUploader.rendered = ->
  Meteor.subscribe 'imagesUploaded', @data.creator
  initQiniuUploader @

getKey = (self, file)-> "#{self.data.creator}-#{new Date().getTime()}-#{file.name}"

initQiniuUploader = (self)->
  Meteor.call 'uptoken', (error, result)->
    if error
      console.log error
    else
      uploader = Qiniu.uploader
        runtimes: 'html5,flash,html4'               #上传模式,依次退化
        browse_button: self.find '.input-button'     #上传选择的点选按钮，**必需**
    #    uptoken_url: '/uptoken'                    #Ajax请求upToken的Url，**强烈建议设置**（服务端提供）
        # downtoken_url: '/downtoken',
        # Ajax请求downToken的Url，私有空间时使用,JS-SDK将向该地址POST文件的key和domain,服务端返回的JSON必须包含`url`字段，`url`值为该文件的下载地址
        uptoken : result                            #若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成
#        unique_names: true                          # 默认 false，key为文件名。若开启该选项，SDK会为每个文件自动生成key（文件名）
        # save_key: true                            # 默认 false。若在服务端生成uptoken的上传策略中指定了 `save_key`，则开启，SDK在前端将不对key进行任何处理
        domain: qiniuConfig.DOMAIN                  #bucket 域名，下载资源时用到，**必需**
#        container: self.find '.input-label'         #上传区域DOM ID，默认是browser_button的父元素，
        max_file_size: '3mb'                        #最大文件体积限制
    #    flash_swf_url: 'js/plupload/Moxie.swf'     #引入flash,相对路径
        max_retries: 3                              #上传失败最大重试次数
        dragdrop: false                             #开启可拖曳上传
    #    drop_element: 'input-label'                 #拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
        chunk_size: '4mb'                           #分块上传时，每片的体积
        auto_start: true                            #选择文件后自动上传，若关闭需要自己绑定事件触发上传
        # Specify what files to browse for
        filters: [{
          title: "Image files"
          extensions: "jpg,gif,png,jpeg"
        }]

        init:
          'Key': (up, file)->
            file.key = getKey self, file
            return file.key

          'BeforeUpload': (up, file)->
            Images.insert
              user: myId()
              creator: self.data.creator
              key: file.key
              uploaded: false
#            hideImageLoading self, file.key

          'UploadProgress': (up, file)->
            showUploadProgress self, file.key, file.percent

          'FileUploaded': (up, file, info)->
            hideUploadProgress self, file.key
#            showImageLoading self, file.key
            info = JSON.parse info
            image = Images.findOne {key: info.key}
            if image
              Images.update {_id: image._id},
                $set:
                  uploaded: true
                  width: info.width
                  height: info.height

          'Error': (up, err, errTip)->
            console.log err, errTip

hideUploadProgress = (self, key)->
  progressLabel = self.$(".image-uploaded[data-key='#{key}'] .progress")
  progressLabel.html('')

showUploadProgress = (self, key, percent)->
  progressLabel = self.$(".image-uploaded[data-key='#{key}'] .progress")
  progressLabel.html(percent + '%')

hideImageLoading = (self, key)->
  imageContainer = self.$(".image-uploaded[data-key='#{key}'] .image-container")
  imageContainer.css {background: '#FFF'}

showImageLoading = (self, key)->
  imageContainer = self.$(".image-uploaded[data-key='#{key}'] .image-container")
  imageContainer.css {background: '#FFF url(/images/loading.gif) no-repeat center center'}
  imagesLoaded ".image-uploaded[data-key='#{key}'] .image-container img", ->
    imageContainer.css {background: '#FFF'}
