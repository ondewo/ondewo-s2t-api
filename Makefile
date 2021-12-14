
generate_doc:
	docker pull pseudomuto/protoc-gen-doc
	-mkdir -p doc
	docker run --rm -v `pwd`/doc:/out -v `pwd`/ondewo/s2t:/protos pseudomuto/protoc-gen-doc --doc_opt=html,index.html

