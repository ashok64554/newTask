@extends('layouts.app')

@section('content')
    <div class="flex-center position-ref full-height">

@if(Request::segment(1)==='add-product')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header"></div>
                @if(Session::has('success'))
                <div class="alert alert-success login-success"> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> {!! Session::get('success') !!} </div>
                @endif

                @if(Session::has('error'))
                <div class="alert alert-danger login-danger"> <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> {!! Session::get('error') !!} </div>
                @endif
                <div class="card-body">
                    <form method="POST" action="{{ route('save-product') }}">
                        @csrf
                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" value="{{ old('name') }}" required autofocus>
                                @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-md-4 col-form-label text-md-right">{{ __('Description') }}</label>

                            <div class="col-md-6">
                                <textarea id="description"  class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" name="description" required=""></textarea>
                                @if ($errors->has('description'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('description') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Price') }}</label>

                            <div class="col-md-6">
                                <input id="price" type="number" class="form-control{{ $errors->has('price') ? ' is-invalid' : '' }}" name="price" value="{{ old('price') }}" required autofocus>
                                @if ($errors->has('price'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('price') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Submit') }}
                                </button>
                                 <a href="{{route('product-list')}}" class="btn btn-info">
                                    {{ __('Back') }}
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@else
        <div class="content">
             <a class="btn btn-primary" href="{{ route('add-product') }}"> <i class="fa fa-plus"></i> Create New Product</a>
            <table id="basic-table" class="data-table table table-striped nowrap table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Create At</th>

                    </tr>
                </thead>
                <tbody>
                    @if(count($productList)>0)
                    <?php
                    $count= 1;
                    ?>
                    @foreach($productList as $product)
                    <tr class="gradeU">
                        <td>{!!$count!!}</td>
                        <td>{!!$product->name!!}</td>
                        <td>{!!$product->description!!}</td>
                        <td>{!!$product->price!!}</td>
                        <td class="text-center">
                            <div class="btn-group btn-group-xs ">
                                @if($product->status=='0') 
                                <span class="text-danger">Inactive</span>
                                @else 
                                <span class="text-success">Active</span>
                                @endif
                            </div>
                        </td>
                        <td>{!! date('d M Y', strtotime($product->created_at))!!}</td>

                    </tr>

                    <?php $count++; ?>
                    @endforeach
                    @else
                    <tr class="gradeU">
                        <td colspan="6">No Product Found......</td>
                    </tr>
                    @endif
                </tbody>
            </table>

        </div>
        @endif
    </div>
@endsection
