<template>
    <div class="notification-box">
        <ul class="list-inline mb-0">
            <li >
                <a href="javascript:void(0);" class="right-bar-toggle">
                    <i class="mdi mdi-bell-outline noti-icon"></i>
                    <span class="badge badge-pill badge-danger"></span>
                </a>
                <div class="noti-dot">
                    <span class="dot"></span>
                    <span class="pulse"></span>
                </div>
            </li>
        </ul>
    </div>
</template>
<script>
export default {     
	props : ['notifications'],
    data (){         
        return {
            arrayNotifications:[]
        } 
    },
    computed:{
        listar: function()  {
            //return this.notifications[0];
             this.arrayNotifications = Object.values(this.notifications[0]);
            if (this.notifications == '') {
                    return this.arrayNotifications = []; 
            } else {
                //Capturo la ultima notificación agregada 
                this.arrayNotifications = Object.values(this.notifications[0]); 
                //Validación por indice fuera de rango
                if (this.arrayNotifications.length > 3) { 
                    //Si el tamaño es > 3 Es cuando las notificaciones son obtenidas desde el mismo servidor, es decir por la consulta con AXIOS 
                    return Object.values(this.arrayNotifications[4]); 
                } else { 
                    //Si el tamaño es < 3 Es cuando las notificaciones son obtenidas desde el canal privado, es decir mediante Laravel Echo y Pusher 
                    return Object.values(this.arrayNotifications[0]);
                } 
            }
        }
    }
}
</script>