<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    function scopeNews($q){
        return $q->where('type', 'news');
    }

    function scopeHelpRequest($q){
        return $q->where('type', 'help_request');
    }

    function helpType(){
        return $this->belongsTo(HelpType::class);
    }

    function postType(){
        return $this->belongsTo(PostType::class);
    }

    function fund(){
        return $this->belongsTo(Fund::class);
    }

    function categories(){
        return $this->belongsToMany(PostCategory::class, 'post_category_post');
    }
}
