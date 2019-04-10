<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use Session;
class ProductController extends Controller
{
     public function productList()
    {   
        $productList = Product::where('status','1')->get();
        return View('product', compact('productList'));
    }
    public function addProduct()
    {  
        return View('product');
    }
     public function saveproduct(Request $request)
    {
        $this->validate($request, [
            'name'         => 'required|max:100|unique:products,name',
            'description'  => 'required',
            'price'        => 'required|numeric',
        ]);
          // First Query  Using Class and  Product and save() accepts a full Eloquent model instance In this all request parameters fetch by class Product(which is in Model Product) and save data using laravel save function//
        	$product= new Product;
        	$product->name 	  		= $request->name;
        	$product->description 	= $request->description;
        	$product->price 		= $request->price;
        	$product->save();
            
          /* // Second Type Query  Model::create is a simple wrapper around $model = new MyModel(); $model->save() See the implementatio and $request->all() function fetch all post/get input of the form and data save Using Laravel create function
            $product = Product::create($request->all()); 
           
           // Thirt Type Query In this query we  create array of all form post data and save by using create function //
           $data = [
            'name'         => $request->name,
            'description'  => $request->description,
            'price'        => $request->price,
           
            ];
        $product=Product::create($data);*/
        if($product)
        {
            Session::flash('success', 'Product successfully Added...');
        }
        else
        {
            Session::flash('error', 'Failed!!!, Please try again');
        }
        return \Redirect()->back();
        
    }
}
