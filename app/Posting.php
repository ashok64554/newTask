<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\PostingWorker;
class Posting extends Model
{
      protected $fillable = [
        'uuid', 'name','status'
         ];

   
}
