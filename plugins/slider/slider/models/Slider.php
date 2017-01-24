<?php namespace Slider\Slider\Models;

use Model;

/**
 * Slider Model
 */
class Slider extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'slider_slider_sliders';

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
    public $attachOne = ['attachments' => ['System\Models\File']];    
    public $attachMany = [];
}
