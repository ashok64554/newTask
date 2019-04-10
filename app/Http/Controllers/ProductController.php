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
          // First Query//
        	$product= new Product;
        	$product->name 	  		= $request->name;
        	$product->description 	= $request->description;
        	$product->price 		= $request->price;
        	$product->save();
            
          /*  // Seconf Type Query//
            $product = Product::create($request->all()); 
           
           // Thirt Type Query//
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
