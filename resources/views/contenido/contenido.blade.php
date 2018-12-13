@extends('principal')
@section('contenido')
    <template v-if="menu==0">
        <h1>Aqui debe ir el Escritorio</h1>
    </template>
    <template v-if="menu==1">
        <Categoria></Categoria>
    </template>
    <template v-if="menu==2">
        <Producto></Producto>
    </template>
    <template v-if="menu==3">
        <h1>Aqui debe ir el menu 3</h1>
    </template>
    <template v-if="menu==4">
        <Proveedor></Proveedor>
    </template>
    <template v-if="menu==5">
        <h1>Aqui debe ir el menu 5</h1>
    </template>
    <template v-if="menu==6">
        <Cliente></Cliente>
    </template>
    <template v-if="menu==7">
        <User></User>
    </template>
    <template v-if="menu==8">
        <Rol></Rol>
    </template>
    <template v-if="menu==9">
        <h1>Aqui debe ir el menu 9</h1>
    </template>
    <template v-if="menu==10">
        <h1>Aqui debe ir el menu 10</h1>
    </template>
    <template v-if="menu==11">
        <h1>Aqui debe ir el menu 11</h1>
    </template>
    <template v-if="menu==12">
        <h1>Aqui debe ir el menu 12</h1>
    </template>
@endsection('contenido')