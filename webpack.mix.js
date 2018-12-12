const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.styles([
   'resources/assets/plantilla/css/bootstrap.min.css',
   'resources/assets/plantilla/css/font-awesome.min.css',
   'resources/assets/plantilla/css/icons.css',
   'resources/assets/plantilla/css/materialdesignicons.css',
   'resources/assets/plantilla/css/simple-line-icons.min.css',
   'resources/assets/plantilla/css/style.css'

], 'public/css/plantilla.css')
.scripts([
   'resources/assets/plantilla/js/jquery.min.js',
   'resources/assets/plantilla/js/popper.min.js',
   'resources/assets/plantilla/js/waves.js',
   'resources/assets/plantilla/js/jquery.slimscroll.js',
   'resources/assets/plantilla/js/jquery.core.js',
   'resources/assets/plantilla/js/jquery.app.js',
   'resources/assets/plantilla/js/sweetalert2.all.js'
], 'public/js/plantilla.js').
js(['resources/assets/js/app.js'],'public/js/app.js').
scripts(['resources/assets/plantilla/js/modernizr.min.js'],'public/js/modernizr.js');