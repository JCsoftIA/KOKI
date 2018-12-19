
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
window.$ = window.jQuery = require('jquery');
window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

Vue.component('categoria', require('./components/Categoria.vue'));
Vue.component('producto', require('./components/Producto.vue'));
Vue.component('cliente', require('./components/Cliente.vue'));
Vue.component('proveedor', require('./components/Proveedor.vue'));
Vue.component('rol', require('./components/Rol.vue'));
Vue.component('user', require('./components/User.vue'));
Vue.component('ingreso', require('./components/Ingreso.vue'));
Vue.component('venta', require('./components/Venta.vue'));
Vue.component('dashboard', require('./components/Dashboard.vue'));
Vue.component('consultaingreso', require('./components/ConsultaIngreso.vue'));
Vue.component('consultaventa', require('./components/ConsultaVenta.vue'));
Vue.component('notification', require('./components/Notification.vue'));
Vue.component('notify', require('./components/Notify.vue'));

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key)))

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#vue',
    data:{
        menu:0,
        notifications: []
    },
    created(){
        let me = this;
        axios.post('notification/get').then(function(response){
            // console.log(response.data);
            me.notifications=response.data;
        }).catch(function(error){
            console.log(error);
        });
        var userId = $('meta[name="userId"]').attr('content');
        Echo.private('App.User.' + userId).notification((notification)=>{
            // console.log(notification);
            me.notifications.unshift(notification);
        });
    }
});