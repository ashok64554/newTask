<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Party;

class PostingExpertise extends Model
{
     protected $fillable = [
        'uuid', 'posting_id','expertise_id'
    ];

   
}
