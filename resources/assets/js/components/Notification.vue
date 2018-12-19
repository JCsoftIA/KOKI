<template>
    <li class="nav-item d-md-down-none">
        <a class="nav-link" href="#" data-toggle="dropdown">
            <i class="icon-bell"></i>
            <span class="badge badge-pill badge-danger">{{notifications.length}}</span>
        </a>  
        <div class="dropdown-menu dropdown-menu-right">
            <div class="dropdown-header text-center">
                <strong>Notificaciones</strong>
            </div>
            <div v-if="notifications.length">
            <li v-for="item in listar" :key="item.id">
            <a class="dropdown-item" href="#">
                <i class="fa fa-envelope-o"></i> {{item.ingresos.msj}}
                <span class="badge badge-success">{{item.ingresos.numero}}</span>
            </a>
            <a class="dropdown-item" href="#">
                <i class="fa fa-tasks"></i> {{item.ventas.msj}}
                <span class="badge badge-danger">{{item.ventas.numero}}</span>
            </a>
            </li>
            </div>
            <div v-else>
                <a><span>No tiene notificaciones</span></a> 
            </div>
        </div>
    </li>
    <!-- <div class="side-bar right-bar">
        <a href="javascript:void(0);" class="right-bar-toggle">
            <i class="mdi mdi-close-circle-outline"></i>
        </a>
        <h4 class="">Notifications <span></span></h4>
        <div class="notification-list nicescroll">
            <ul class="list-group list-no-border user-list">
                
                <li v-for="item in listar" :key="item.id" class="list-group-item active">
                    
                    <a href="#" class="user-list-item">
                        <div class="icon bg-info">
                            <i class="mdi mdi-comment"></i>
                        </div>
                        <div class="user-desc">
                            <span class="name">{{item.ingresos.msj}}</span>
                            <span class="name">{{item.ingresos.numero}}</span>
                            <span class="time">{{item.updated_at}}</span>
                        </div>
                    </a>
                    <a href="#" class="user-list-item">
                        <div class="icon bg-danger">
                            <i class="mdi mdi-comment"></i>
                        </div>
                        <div class="user-desc">
                            <span class="name">{{item.ventas.msj}}</span>
                            <span class="name">{{item.ventas.numero}}</span>
                            <span class="time">{{item.updated_at}}</span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div> -->
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
            // return Object.values(this.notifications);
             this.arrayNotifications = Object.values(this.notifications[0]);
             console.log('el array '+this.arrayNotifications);
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