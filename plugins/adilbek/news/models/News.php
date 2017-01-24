<?php namespace Adilbek\News\Models;

use Model;

/**
 * News Model
 */
class News extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'adilbek_news_news';

    /**
     * @var array Guarded fields
     */
    protected $guarded = ['*'];

    /**
     * @var array Fillable fields
     */
    protected $fillable = [];

    /**
     * @var array Relations
     */
    public $hasOne = [];
    public $hasMany = [];
    public $belongsTo = [];
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = ['attachments' => ['System\Models\File']];
}
