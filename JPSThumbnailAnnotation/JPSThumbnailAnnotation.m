//
//  JPSThumbnailAnnotation.m
//  JPSThumbnailAnnotationView
//
//  Created by Jean-Pierre Simard on 4/21/13.
//  Copyright (c) 2013 JP Simard. All rights reserved.
//

#import "JPSThumbnailAnnotation.h"
//#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+AFNetworking.h"

@implementation JPSThumbnailAnnotation

+ (instancetype)annotationWithThumbnail:(JPSThumbnail *)thumbnail {
    return [[self alloc] initWithThumbnail:thumbnail];
}


- (id)initWithThumbnail:(JPSThumbnail *)thumbnail {
    self = [super init];
    if (self) {
        _coordinate = thumbnail.coordinate;
        _thumbnail = thumbnail;
    }
    
    return self;
}

- (MKAnnotationView *)annotationViewInMap:(MKMapView *)mapView {
    if (!_view) {
        _view = (JPSThumbnailAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"JPSThumbnailAnnotationView"];
        if (!_view) _view = [[JPSThumbnailAnnotationView alloc] initWithAnnotation:self];
    } else {
        _view.annotation = self;
    }
    [self updateThumbnail:_thumbnail animated:NO];
    return _view;
}

- (void)updateThumbnail:(JPSThumbnail *)thumbnail animated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.33f animations:^{
            _coordinate = thumbnail.coordinate;
        }];
    } else {
        _coordinate = thumbnail.coordinate;
    }
    
    if (_view) {
        _view.coordinate = self.coordinate;
        _view.titleLabel.text = thumbnail.title;
        _view.subtitleLabel.text = thumbnail.subtitle;
        //
        //_view.imageView.image = thumbnail.image;
        if(thumbnail.imgUrl){
            //[_view.imageView setImageWithURL:[NSURL URLWithString:thumbnail.imgUrl]];
            
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:thumbnail.imgUrl]];
            [_view.imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                _view.imageView.image = image;
            } failure:nil];
            
        }
        
        
        _view.disclosureBlock = thumbnail.disclosureBlock;
    }
}

@end
