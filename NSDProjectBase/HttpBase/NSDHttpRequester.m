//
//  BaseRequestEngine.m
//  EtahShadow
//
//  Created by apple on 2018/12/26.
//  Copyright © 2018 Nee. All rights reserved.
//

#import "NSDHttpRequester.h"
#import <AFNetworking/AFHTTPSessionManager.h>

@implementation NSDHttpRequester

- (void)nsd_RequestStartWithSuccessBlock:(NSDHttpSuccessBlock)successBlock
                             FailedBlock:(NSDHttpFailedBlock)failedBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    for(NSString *key in self.requestHeader.allKeys)
    {
        [manager.requestSerializer setValue:self.requestHeader[key] forHTTPHeaderField:key];
    }
    
    if ([self.requestType isEqualToString:@"POST"]) {
        [manager POST:self.requestUrl parameters:self.requestParam progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self nsd_RequstSuccessDealWithData:responseObject SuccessBlock:successBlock];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failedBlock(error);
        }];
    }
    else if ([self.requestType isEqualToString:@"GET"]) {
        [manager GET:self.requestUrl parameters:self.requestParam progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self nsd_RequstSuccessDealWithData:responseObject SuccessBlock:successBlock];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failedBlock(error);
        }];
    }
}

- (void)nsd_UploadFileWithFileData:(NSData *)data
                          FileName:(NSString *)fileName
                           FileKey:(NSString *)fileKey
                          FileType:(NSString *)fileType
                      SuccessBlock:(NSDHttpSuccessBlock)successBlock
                       FailedBlock:(NSDHttpFailedBlock)failedBlock
{
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    for(NSString *key in self.requestHeader.allKeys)
    {
        [requestSerializer setValue:self.requestHeader[key] forHTTPHeaderField:key];
    }
    
    NSMutableURLRequest *request = [requestSerializer multipartFormRequestWithMethod:@"POST"
                                                                           URLString:self.requestUrl
                                                                          parameters:nil
                                                           constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                                               [formData appendPartWithFileData:data name:fileKey fileName:fileName mimeType:fileType];
                                                           }error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/plain",@"multipart/form-data", nil];
    manager.responseSerializer = serializer;
    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          failedBlock(error);
                      } else {
                          
                          [self nsd_RequstSuccessDealWithData:responseObject SuccessBlock:successBlock];
                          
                      }
                  }];
    [uploadTask resume];
}


- (void)nsd_RequstSuccessDealWithData:(id  _Nullable)responseObject
                         SuccessBlock:(NSDHttpSuccessBlock)successBlock
{
    NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    
    if (self.originDataClass == NSDOriginDataClassString) {
        successBlock(responseString);
    }
    else
    {
        NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
        
        id resultObject =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if(self.originDataModel)
        {
            if(self.originDataClass == NSDOriginDataClassDictionary) {
                successBlock([[self.originDataModel alloc] initWithDictionary:(NSDictionary *)resultObject error:nil]);
            }
            else
            {
                NSArray *array = (NSArray *)resultObject;
                NSMutableArray *resultArray = [NSMutableArray new];
                for (NSDictionary *dic in array) {
                    [resultArray addObject:[[self.originDataModel alloc] initWithDictionary:dic error:nil]];
                }
                successBlock(resultArray);
            }
        }
        else
        {
            successBlock(resultObject);
        }
    }
}
@end
