var gulp = require('gulp'),
	concat = require('gulp-concat'),
	sass = require('gulp-sass'),
	imagemin=require('gulp-imagemin'),
	uglify=require('gulp-uglify');

gulp.task('sass', function () {
  	gulp.src('./src/sass/*.scss')
    	.pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
    	.pipe(gulp.dest('./css'));
});

gulp.task('imagemin',function(){
	gulp.src('./src/images/*')
        .pipe(imagemin())
        .pipe(gulp.dest('./imgs'));
});

gulp.task('scripts', function() {
  	gulp.src('./src/js/*.js')
	    .pipe(concat('public.js'))
	    .pipe(gulp.dest('./js/common'));
});
gulp.task('uglify',function(){
	gulp.src('./js/common/public.js')
		.pipe(uglify({
	        mangle:true,               // 是否修改变量名，默认为 true
	        compress:true,             // 是否完全压缩，默认为 true
	        preserveComments: 'all'    // 保留所有注释
    	}))
    	.pipe(gulp.dest('./js/common/public.min.js'))
})
gulp.task('watch', function () {
  gulp.watch('./src/sass/*.scss', ['sass']);
  gulp.watch('./src/js/*.js', ['scripts']);
  gulp.watch('./src/images/*', ['imagemin']);
});

gulp.task('default',['sass','imagemin','scripts','watch']);