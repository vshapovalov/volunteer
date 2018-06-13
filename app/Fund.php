<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Fund extends Model
{
    function files(){
        return $this->hasMany(FundFile::class);
    }

    function users(){
        return $this->belongsToMany(User::class, 'fund_user')->withPivot(['type', 'position', 'image', 'contact']);
    }

    function posts(){
        return $this->hasMany(Post::class);
    }
}
