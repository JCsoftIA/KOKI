@extends('principal')
@section('contenido')
    <template v-if="menu==0">
        <h1>Aqui debe ir el Escritorio</h1>
    </template>
    <template v-if="menu==1">
        <Categoria></Categoria>
    </template>
    <template v-if="menu==2">
        <h1>Aqui debe ir el menu 2</h1>
        <h2>Hagan esta parte llamas</h2>
    </template>
    <template v-if="menu==3">
        <h1>Aqui debe ir el menu 3</h1>
    </template>
    <template v-if="menu==4">
        <h1>Aqui debe ir el menu 4</h1>
    </template>
    <template v-if="menu==5">
        <h1>Aqui debe ir el menu 5</h1>
    </template>
    <template v-if="menu==6">
        <h1>Aqui debe ir el menu 6</h1>
    </template>
    <template v-if="menu==7">
        <h1>Aqui debe ir el menu 7</h1>
    </template>
    <template v-if="menu==8">
        <h1>Aqui debe ir el menu 8</h1>
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